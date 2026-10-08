# Snapshot the previous programs.json so the new data can be compared against it
[ -f programs.json ] && cp programs.json old-programs.json
[ -f old-programs.json ] || echo '[]' > old-programs.json

jq -s 'add' \
<(curl -s "https://raw.githubusercontent.com/arkadiyt/bounty-targets-data/refs/heads/main/data/yeswehack_data.json" | jq --arg date "$(date +%F)" '[.[] | {
  name,
  program_url: ("https://yeswehack.com/programs/" + .id),
  logo: "https://yeswehack.com/assets/images/favicon.ico",
  platform: "YesWeHack",
  reward: ("$" + (.max_bounty | tostring)),
  inscope_domains: [.targets.in_scope[].target],
  outofscope_domains: [.targets.out_of_scope[].target],
  issues_reported: [],
  scamhit: "",
  last_updated: $date
}]') \
<(curl -s "https://raw.githubusercontent.com/arkadiyt/bounty-targets-data/refs/heads/main/data/intigriti_data.json" | jq --arg date "$(date +%F)" '[.[] | {
  name,
  program_url: .url,
  logo: "https://login.intigriti.com/apple-touch-icon.png",
  platform: "Intigriti",
  reward: (
    (.max_bounty.currency
      | if . == "EUR" then "€"
        elif . == "USD" then "$"
        else .
        end
    ) + (.max_bounty.value | tostring)
  ),
  inscope_domains: [.targets.in_scope[].endpoint],
  outofscope_domains: [.targets.out_of_scope[].endpoint],
  issues_reported: [],
  scamhit: "",
  last_updated: $date
}]') \
<(curl -s "https://raw.githubusercontent.com/arkadiyt/bounty-targets-data/refs/heads/main/data/bugcrowd_data.json" | jq --arg date "$(date +%F)" '[.[] | {
  name,
  program_url: .url,
  logo: "https://www.bugcrowd.com/wp-content/themes/bugcrowd/assets/images/favicon/favicon-32x32.png",
  platform: "Bugcrowd",
  reward: ("$" + (.max_payout | tostring)),
  inscope_domains: [.targets.in_scope[].target],
  outofscope_domains: [.targets.out_of_scope[].target],
  issues_reported: [],
  scamhit: "",
  last_updated: $date
}]') \
<(curl -s "https://raw.githubusercontent.com/arkadiyt/bounty-targets-data/refs/heads/main/data/hackerone_data.json" | jq --arg date "$(date +%F)" '[.[] | {
  name,
  program_url: .url,
  logo: "https://www.hackerone.com/themes/custom/hackerone/assets/favicons/favicon.ico",
  platform: "HackerOne",
  reward: (
    if .offers_bounties == true then
      "$$$"
    else
      "-"
    end
  ),
  inscope_domains: [.targets.in_scope[].asset_identifier],
  outofscope_domains: [.targets.out_of_scope[].asset_identifier],
  issues_reported: [],
  scamhit: "",
  last_updated: $date
}]') \
> new-programs.json

# Merge new data with the old file:
#  - program unchanged (reward, inscope_domains, outofscope_domains) -> keep old last_updated
#  - program changed or newly added                                  -> keep today's date
#  - issues_reported / scamhit are preserved from the old file
#  - programs only present in the old file are kept as they were
jq --slurpfile old old-programs.json '
  def key: .platform + "|" + .name;
  def same($o): ((.reward) == $o.reward)
    and ((.inscope_domains | sort) == ($o.inscope_domains | sort))
    and ((.outofscope_domains | sort) == ($o.outofscope_domains | sort));
  ($old[0] | map({(key): .}) | add // {}) as $idx
  | . as $new
  | ($new | map({(key): true}) | add // {}) as $seen
  | ($new | map(
      . as $p
      | if $idx[key] then
          $idx[key] as $o
          | $p
          | .issues_reported = $o.issues_reported
          | .scamhit = $o.scamhit
          | if same($o) then .last_updated = $o.last_updated else . end
        else . end
    ))
    + ($old[0] | map(select($seen[key] | not)))
' new-programs.json > programs.json

rm -f new-programs.json
