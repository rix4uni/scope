## scope

**scope** is a CLI tool and curated dataset for querying bug bounty program scopes across multiple platforms (Bugcrowd, HackerOne, Intigriti, YesWeHack). It helps security researchers quickly find which programs have specific domains or assets in scope.

### What this repo contains:
- **Automated data**: Scope data fetched and updated every 10 minutes from popular bug bounty platforms
- **CLI tool**: A simple command to search programs by target (e.g., `scope *.tidal.com`)
- **Categorized files**: Wildcards, domains, and GitHub repos separated by platform and scope type

#### NewData:
- #### Wildcards
  - [newdata_inscope_wildcards.txt](https://github.com/rix4uni/scope/blob/main/data/NewData/newdata_inscope_wildcards.txt) - Contains wildcard patterns (e.g., `*.example.com`) for matching subdomains

- #### Domains
  - [newdata_inscope_domains.txt](https://github.com/rix4uni/scope/blob/main/data/NewData/newdata_inscope_domains.txt) - Contains full domain names (e.g., `api.example.com`)

- #### GithubRepo
  - [newdata_inscope_github_repo.txt](https://github.com/rix4uni/scope/blob/main/data/NewData/newdata_inscope_github_repo.txt) - Contains GitHub repository URLs (e.g., `https://github.com/org/repo`)


#### AllData:
- #### All inscope
  - [inscope.txt](https://github.com/rix4uni/scope/blob/main/data/inscope.txt) - Combined list of all in-scope targets (wildcards + domains + GitHub repos)

- #### All outofscope
  - [outofscope.txt](https://github.com/rix4uni/scope/blob/main/data/outofscope.txt) - Combined list of all out-of-scope targets to exclude


#### Main files:
- #### Wildcards:
  - [inscope_wildcards.txt](https://github.com/rix4uni/scope/blob/main/data/Wildcards/inscope_wildcards.txt) - All in-scope wildcard patterns
  - [outofscope_wildcards.txt](https://github.com/rix4uni/scope/blob/main/data/Wildcards/outofscope_wildcards.txt) - Wildcard patterns explicitly out of scope

- #### Domains:
  - [inscope_domains.txt](https://github.com/rix4uni/scope/blob/main/data/Domains/inscope_domains.txt) - All in-scope full domains
  - [outofscope_domains.txt](https://github.com/rix4uni/scope/blob/main/data/Domains/outofscope_domains.txt) - Domains explicitly out of scope

- #### GithubRepo:
  - [inscope_github_repo.txt](https://github.com/rix4uni/scope/blob/main/data/GithubRepo/inscope_github_repo.txt) - All in-scope GitHub repositories
  - [outofscope_github_repo.txt](https://github.com/rix4uni/scope/blob/main/data/GithubRepo/outofscope_github_repo.txt) - GitHub repositories explicitly out of scope


#### Platform Based files:
- #### Bugcrowd:
  - [bugcrowd_inscope.txt](https://github.com/rix4uni/scope/blob/main/data/Bugcrowd/bugcrowd_inscope.txt) - In-scope targets from Bugcrowd programs
  - [bugcrowd_outofscope.txt](https://github.com/rix4uni/scope/blob/main/data/Bugcrowd/bugcrowd_outofscope.txt) - Out-of-scope targets from Bugcrowd programs

  - [bugcrowd_github_repo_inscope.txt](https://github.com/rix4uni/scope/blob/main/data/Bugcrowd/bugcrowd_github_repo_inscope.txt) - In-scope GitHub repos from Bugcrowd
  - [bugcrowd_github_repo_outofscope.txt](https://github.com/rix4uni/scope/blob/main/data/Bugcrowd/bugcrowd_github_repo_outofscope.txt) - Out-of-scope GitHub repos from Bugcrowd

- #### Hackerone:
  - [hackerone_inscope.txt](https://github.com/rix4uni/scope/blob/main/data/Hackerone/hackerone_inscope.txt) - In-scope targets from HackerOne programs
  - [hackerone_outofscope.txt](https://github.com/rix4uni/scope/blob/main/data/Hackerone/hackerone_outofscope.txt) - Out-of-scope targets from HackerOne programs

  - [hackerone_github_repo_inscope.txt](https://github.com/rix4uni/scope/blob/main/data/Hackerone/hackerone_github_repo_inscope.txt) - In-scope GitHub repos from HackerOne
  - [hackerone_github_repo_outofscope.txt](https://github.com/rix4uni/scope/blob/main/data/Hackerone/hackerone_github_repo_outofscope.txt) - Out-of-scope GitHub repos from HackerOne

- #### Intigriti:
  - [intigriti_inscope.txt](https://github.com/rix4uni/scope/blob/main/data/Intigriti/intigriti_inscope.txt) - In-scope targets from Intigriti programs
  - [intigriti_outofscope.txt](https://github.com/rix4uni/scope/blob/main/data/Intigriti/intigriti_outofscope.txt) - Out-of-scope targets from Intigriti programs

  - [intigriti_github_repo_inscope.txt](https://github.com/rix4uni/scope/blob/main/data/Intigriti/intigriti_github_repo_inscope.txt) - In-scope GitHub repos from Intigriti
  - [intigriti_github_repo_outofscope.txt](https://github.com/rix4uni/scope/blob/main/data/Intigriti/intigriti_github_repo_outofscope.txt) - Out-of-scope GitHub repos from Intigriti

- #### Yeswehack:
  - [yeswehack_inscope.txt](https://github.com/rix4uni/scope/blob/main/data/Yeswehack/yeswehack_inscope.txt) - In-scope targets from YesWeHack programs
  - [yeswehack_outofscope.txt](https://github.com/rix4uni/scope/blob/main/data/Yeswehack/yeswehack_outofscope.txt) - Out-of-scope targets from YesWeHack programs

  - [yeswehack_github_repo_inscope.txt](https://github.com/rix4uni/scope/blob/main/data/Yeswehack/yeswehack_github_repo_inscope.txt) - In-scope GitHub repos from YesWeHack
  - [yeswehack_github_repo_outofscope.txt](https://github.com/rix4uni/scope/blob/main/data/Yeswehack/yeswehack_github_repo_outofscope.txt) - Out-of-scope GitHub repos from YesWeHack

## 📌 References
- https://github.com/arkadiyt/bounty-targets-data
- https://github.com/Osb0rn3/bugbounty-targets

## regex tested on `regex101.com`
You can improve these regex for more accurate data.
- https://regex101.com/r/1z8v70/1
- https://regex101.com/r/1z8v70/2
- https://regex101.com/r/1z8v70/3

## Installation

Install the `scope` CLI tool with a single command:

```console
wget -q -O /usr/bin/scope https://raw.githubusercontent.com/rix4uni/scope/refs/heads/main/scope && chmod +x /usr/bin/scope
```

## Usage

Search for bug bounty programs by domain, wildcard, or asset:

```console
▶ scope *.tidal.com
{
  "name": "TIDAL",
  "url": "https://bugcrowd.com/engagements/tidal-bugbounty",
  "allows_disclosure": true,
  "managed_by_bugcrowd": true,
  "safe_harbor": "full",
  "max_payout": 5000,
  "targets": {
    "in_scope": [
      {
        "type": "website",
        "target": "https://tidal.com/",
        "uri": "https://tidal.com/",
        "name": "*.tidal.com",
        "ipAddress": null
      },
      {
        "type": "website",
        "target": "*.wimpmusic.com",
        "uri": "",
        "name": "*.wimpmusic.com",
        "ipAddress": null
      },
      {
        "type": "website",
        "target": "*.tidalhifi.com",
        "uri": "",
        "name": "*.tidalhifi.com",
        "ipAddress": null
      },
      {
        "type": "api",
        "target": "api.tidal.com",
        "uri": "",
        "name": "api.tidal.com",
        "ipAddress": null
      },
      {
        "type": "website",
        "target": "*tidalhi.fi",
        "uri": "",
        "name": "*tidalhi.fi",
        "ipAddress": null
      },
      {
        "type": "website",
        "target": "*.tdl.sh",
        "uri": "",
        "name": "*.tdl.sh",
        "ipAddress": null
      },
      {
        "type": "ios",
        "target": "Tidal Client for iOS",
        "uri": "",
        "name": "Tidal Client for iOS",
        "ipAddress": null
      },
      {
        "type": "android",
        "target": "Tidal Client for Android",
        "uri": "",
        "name": "Tidal Client for Android",
        "ipAddress": null
      },
      {
        "type": "other",
        "target": "https://offer.tidal.com/download",
        "uri": "https://offer.tidal.com/download",
        "name": "Tidal Desktop Client",
        "ipAddress": null
      },
      {
        "type": "other",
        "target": "Tidal Official Clients (e.g. Sonos integration, Tesla integration, etc.)",
        "uri": "",
        "name": "Tidal Official Clients (e.g. Sonos integration, Tesla integration, etc.)",
        "ipAddress": null
      }
    ],
    "out_of_scope": [
      {
        "type": "other",
        "target": "https://developer.tidal.com",
        "uri": "https://developer.tidal.com",
        "name": "developer.tidal.com",
        "ipAddress": ""
      },
      {
        "type": "other",
        "target": "https://embed.tidal.com",
        "uri": "https://embed.tidal.com",
        "name": "embed.tidal.com",
        "ipAddress": ""
      }
    ]
  }
}
```

```console
▶ scope *.gov.sg
{
  "id": "govtech-vulnerability-disclosure-programme-policy",
  "name": "GovTech - Vulnerability Disclosure Programme",
  "public": true,
  "disabled": false,
  "managed": null,
  "min_bounty": null,
  "max_bounty": null,
  "targets": {
    "in_scope": [
      {
        "target": "*.gov.sg",
        "type": "other"
      },
      {
        "target": "Domains where GovTech is the registrar",
        "type": "other"
      }
    ],
    "out_of_scope": [
      {
        "target": "All domains or subdomains not listed in the above list of 'Scopes'",
        "type": "other"
      }
    ]
  }
}
```

The tool searches across all supported platforms (Bugcrowd, HackerOne, Intigriti, YesWeHack) and returns complete program details including in-scope and out-of-scope targets.