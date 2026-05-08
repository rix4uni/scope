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
<(curl -s "https://raw.githubusercontent.com/KrazePlanet/KrazePlanetPrograms/refs/heads/main/programs.json") \
> programs.json
