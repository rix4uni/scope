# Downloading bugbounty-targets repo in zip
wget -P arkadiyt -q https://github.com/arkadiyt/bounty-targets-data/archive/refs/heads/main.zip
unzip -q arkadiyt/main.zip -d arkadiyt

# Delete old files
mv data old_data

# Creating Required Directory
mkdir -p data
mkdir -p data/Bugcrowd
mkdir -p data/Hackerone
mkdir -p data/Intigriti
mkdir -p data/Yeswehack
mkdir -p data/Wildcards
mkdir -p data/Domains
mkdir -p data/GithubRepo
mkdir -p data/NewData


# Bugcrowd
cat arkadiyt/bounty-targets-data-main/data/bugcrowd_data.json | grep -aEv "https://play.google.com/|https://apps.apple.com/" | jq -r '.[].targets.in_scope[] | .target, .uri, .name' | grep -oP '(\*-[a-zA-Z0-9]+(\.[a-zA-Z0-9]+)*\.[a-zA-Z]{2,}|\*\.?[a-zA-Z0-9]+([.-][a-zA-Z0-9]+)*\.[a-zA-Z]{2,}|[a-zA-Z0-9]+([.-][a-zA-Z0-9]+)*\.[a-zA-Z]{2,}|[a-zA-Z0-9]+(\.\*)?\.[a-zA-Z0-9]+(\.[a-zA-Z]{2,}))' | tr "," "\n" | sed 's/http[s]*:\/\/\|www.//g' | cut -d'/' -f1 | tr " " "\n" | sed 's/\s//g' | egrep -v "@" | egrep -v "^com\." | egrep -aiv '.(jpg|jpeg|gif|css|tif|tiff|png|ttf|woff|woff2|icon|pdf|svg|txt|js|ios|apk|android|php|json|jsp|yaml|exe|html)$' | grep "\." | unew -el -t -i -q data/Bugcrowd/bugcrowd_inscope.txt
cat arkadiyt/bounty-targets-data-main/data/bugcrowd_data.json | grep -aEv "https://play.google.com/|https://apps.apple.com/" | jq -r '.[].targets.out_of_scope[] | .target, .uri, .name' | grep -oP '(\*-[a-zA-Z0-9]+(\.[a-zA-Z0-9]+)*\.[a-zA-Z]{2,}|\*\.?[a-zA-Z0-9]+([.-][a-zA-Z0-9]+)*\.[a-zA-Z]{2,}|[a-zA-Z0-9]+([.-][a-zA-Z0-9]+)*\.[a-zA-Z]{2,}|[a-zA-Z0-9]+(\.\*)?\.[a-zA-Z0-9]+(\.[a-zA-Z]{2,}))' | tr "," "\n" | sed 's/http[s]*:\/\/\|www.//g' | cut -d'/' -f1 | tr " " "\n" | sed 's/\s//g' | egrep -v "@" | egrep -v "^com\." | egrep -aiv '.(jpg|jpeg|gif|css|tif|tiff|png|ttf|woff|woff2|icon|pdf|svg|txt|js|ios|apk|android|php|json|jsp|yaml|exe|html)$' | grep "\." | unew -el -t -i -q data/Bugcrowd/bugcrowd_outofscope.txt
cat arkadiyt/bounty-targets-data-main/data/bugcrowd_data.json | jq -r '.[].targets.in_scope[] | .target, .uri, .name' | grep "^https://github.com" | awk '{print $1}' | sed -e 's/\/\*$//' -e 's/\/$//' -e 's/#.*//' | cut -d"/" -f1-5 | unew -el -t -q data/Bugcrowd/bugcrowd_github_repo_inscope.txt
cat arkadiyt/bounty-targets-data-main/data/bugcrowd_data.json | jq -r '.[].targets.out_of_scope[] | .target, .uri, .name' | grep "^https://github.com" | awk '{print $1}' | sed -e 's/\/\*$//' -e 's/\/$//' -e 's/#.*//' | cut -d"/" -f1-5 | unew -el -t -q data/Bugcrowd/bugcrowd_github_repo_outofscope.txt


# Hackerone
cat arkadiyt/bounty-targets-data-main/data/hackerone_data.json | grep -aEv "https://play.google.com/|https://apps.apple.com/" | jq -r '.[] | .targets.in_scope[] | select(.eligible_for_bounty==true) | .asset_identifier, .instruction' | grep -oP '(\*-[a-zA-Z0-9]+(\.[a-zA-Z0-9]+)*\.[a-zA-Z]{2,}|\*\.?[a-zA-Z0-9]+([.-][a-zA-Z0-9]+)*\.[a-zA-Z]{2,}|[a-zA-Z0-9]+([.-][a-zA-Z0-9]+)*\.[a-zA-Z]{2,}|[a-zA-Z0-9]+(\.\*)?\.[a-zA-Z0-9]+(\.[a-zA-Z]{2,}))' | tr "," "\n" | sed 's/http[s]*:\/\/\|www.//g' | cut -d'/' -f1 | tr " " "\n" | sed 's/\s//g' | egrep -v "@" | egrep -v "^com\." | egrep -aiv '.(jpg|jpeg|gif|css|tif|tiff|png|ttf|woff|woff2|icon|pdf|svg|txt|js|ios|apk|android|php|json|jsp|yaml|exe|html)$' | grep "\." | unew -el -t -i -q data/Hackerone/hackerone_inscope.txt
cat arkadiyt/bounty-targets-data-main/data/hackerone_data.json | grep -aEv "https://play.google.com/|https://apps.apple.com/" | jq -r '.[] | .targets.out_of_scope[] | select(.eligible_for_bounty==false) | .asset_identifier, .instruction' | grep -oP '(\*-[a-zA-Z0-9]+(\.[a-zA-Z0-9]+)*\.[a-zA-Z]{2,}|\*\.?[a-zA-Z0-9]+([.-][a-zA-Z0-9]+)*\.[a-zA-Z]{2,}|[a-zA-Z0-9]+([.-][a-zA-Z0-9]+)*\.[a-zA-Z]{2,}|[a-zA-Z0-9]+(\.\*)?\.[a-zA-Z0-9]+(\.[a-zA-Z]{2,}))' | tr "," "\n" | sed 's/http[s]*:\/\/\|www.//g' | cut -d'/' -f1 | tr " " "\n" | sed 's/\s//g' | egrep -v "@" | egrep -v "^com\." | egrep -aiv '.(jpg|jpeg|gif|css|tif|tiff|png|ttf|woff|woff2|icon|pdf|svg|txt|js|ios|apk|android|php|json|jsp|yaml|exe|html)$' | grep "\." | unew -el -t -i -q data/Hackerone/hackerone_outofscope.txt
cat arkadiyt/bounty-targets-data-main/data/hackerone_data.json | jq -r '.[] | .targets.in_scope[] | select(.eligible_for_bounty==true) | .asset_identifier, .instruction' | grep "^https://github.com" | awk '{print $1}' | sed -e 's/\/\*$//' -e 's/\/$//' -e 's/#.*//' | cut -d"/" -f1-5 | unew -el -t -q data/Hackerone/hackerone_github_repo_inscope.txt
cat arkadiyt/bounty-targets-data-main/data/hackerone_data.json | jq -r '.[] | .targets.out_of_scope[] | select(.eligible_for_bounty==false) | .asset_identifier, .instruction' | grep "^https://github.com" | awk '{print $1}' | sed -e 's/\/\*$//' -e 's/\/$//' -e 's/#.*//' | cut -d"/" -f1-5 | unew -el -t -q data/Hackerone/hackerone_github_repo_outofscope.txt


# Intigriti
cat arkadiyt/bounty-targets-data-main/data/intigriti_data.json | grep -aEv "https://play.google.com/|https://apps.apple.com/" | jq -r '.[] | .targets.in_scope[] | select(.impact!="No Bounty") | .endpoint' | grep -oP '(\*-[a-zA-Z0-9]+(\.[a-zA-Z0-9]+)*\.[a-zA-Z]{2,}|\*\.?[a-zA-Z0-9]+([.-][a-zA-Z0-9]+)*\.[a-zA-Z]{2,}|[a-zA-Z0-9]+([.-][a-zA-Z0-9]+)*\.[a-zA-Z]{2,}|[a-zA-Z0-9]+(\.\*)?\.[a-zA-Z0-9]+(\.[a-zA-Z]{2,}))' | tr "," "\n" | sed 's/http[s]*:\/\/\|www.//g' | cut -d'/' -f1 | tr " " "\n" | sed 's/\s//g' | egrep -v "@" | egrep -v "^com\." | egrep -aiv '.(jpg|jpeg|gif|css|tif|tiff|png|ttf|woff|woff2|icon|pdf|svg|txt|js|ios|apk|android|php|json|jsp|yaml|exe|html)$' | grep "\." | unew -el -t -i -q data/Intigriti/intigriti_inscope.txt
cat arkadiyt/bounty-targets-data-main/data/intigriti_data.json | grep -aEv "https://play.google.com/|https://apps.apple.com/" | jq -r '.[] | .targets.out_of_scope[] | select(.impact!="No Bounty") | .endpoint' | grep -oP '(\*-[a-zA-Z0-9]+(\.[a-zA-Z0-9]+)*\.[a-zA-Z]{2,}|\*\.?[a-zA-Z0-9]+([.-][a-zA-Z0-9]+)*\.[a-zA-Z]{2,}|[a-zA-Z0-9]+([.-][a-zA-Z0-9]+)*\.[a-zA-Z]{2,}|[a-zA-Z0-9]+(\.\*)?\.[a-zA-Z0-9]+(\.[a-zA-Z]{2,}))' | tr "," "\n" | sed 's/http[s]*:\/\/\|www.//g' | cut -d'/' -f1 | tr " " "\n" | sed 's/\s//g' | egrep -v "@" | egrep -v "^com\." | egrep -aiv '.(jpg|jpeg|gif|css|tif|tiff|png|ttf|woff|woff2|icon|pdf|svg|txt|js|ios|apk|android|php|json|jsp|yaml|exe|html)$' | grep "\." | unew -el -t -i -q data/Intigriti/intigriti_outofscope.txt
cat arkadiyt/bounty-targets-data-main/data/intigriti_data.json | jq -r '.[] | .targets.in_scope[] | select(.impact!="No Bounty") | .endpoint' | grep "^https://github.com" | awk '{print $1}' | sed -e 's/\/\*$//' -e 's/\/$//' -e 's/#.*//' | cut -d"/" -f1-5 | unew -el -t -q data/Intigriti/intigriti_github_repo_inscope.txt
cat arkadiyt/bounty-targets-data-main/data/intigriti_data.json | jq -r '.[] | .targets.out_of_scope[] | select(.impact!="No Bounty") | .endpoint' | grep "^https://github.com" | awk '{print $1}' | sed -e 's/\/\*$//' -e 's/\/$//' -e 's/#.*//' | cut -d"/" -f1-5 | unew -el -t -q data/Intigriti/intigriti_github_repo_outofscope.txt

# Yeswehack
cat arkadiyt/bounty-targets-data-main/data/yeswehack_data.json | grep -aEv "https://play.google.com/|https://apps.apple.com/" | jq -r '.[].targets.in_scope[].target' | grep -oP '(\*-[a-zA-Z0-9]+(\.[a-zA-Z0-9]+)*\.[a-zA-Z]{2,}|\*\.?[a-zA-Z0-9]+([.-][a-zA-Z0-9]+)*\.[a-zA-Z]{2,}|[a-zA-Z0-9]+([.-][a-zA-Z0-9]+)*\.[a-zA-Z]{2,}|[a-zA-Z0-9]+(\.\*)?\.[a-zA-Z0-9]+(\.[a-zA-Z]{2,}))' | tr "," "\n" | sed 's/http[s]*:\/\/\|www.//g' | cut -d'/' -f1 | tr " " "\n" | sed 's/\s//g' | egrep -v "@" | egrep -v "^com\." | egrep -aiv '.(jpg|jpeg|gif|css|tif|tiff|png|ttf|woff|woff2|icon|pdf|svg|txt|js|ios|apk|android|php|json|jsp|yaml|exe|html)$' | grep "\." | unew -el -t -i -q data/Yeswehack/yeswehack_inscope.txt
cat arkadiyt/bounty-targets-data-main/data/yeswehack_data.json | grep -aEv "https://play.google.com/|https://apps.apple.com/" | jq -r '.[].targets.out_of_scope[].target' | grep -oP '(\*-[a-zA-Z0-9]+(\.[a-zA-Z0-9]+)*\.[a-zA-Z]{2,}|\*\.?[a-zA-Z0-9]+([.-][a-zA-Z0-9]+)*\.[a-zA-Z]{2,}|[a-zA-Z0-9]+([.-][a-zA-Z0-9]+)*\.[a-zA-Z]{2,}|[a-zA-Z0-9]+(\.\*)?\.[a-zA-Z0-9]+(\.[a-zA-Z]{2,}))' | tr "," "\n" | sed 's/http[s]*:\/\/\|www.//g' | cut -d'/' -f1 | tr " " "\n" | sed 's/\s//g' | egrep -v "@" | egrep -v "^com\." | egrep -aiv '.(jpg|jpeg|gif|css|tif|tiff|png|ttf|woff|woff2|icon|pdf|svg|txt|js|ios|apk|android|php|json|jsp|yaml|exe|html)$' | grep "\." | unew -el -t -i -q data/Yeswehack/yeswehack_outofscope.txt
cat arkadiyt/bounty-targets-data-main/data/yeswehack_data.json | jq -r '.[].targets.in_scope[].target' | grep "^https://github.com" | awk '{print $1}' | sed -e 's/\/\*$//' -e 's/\/$//' -e 's/#.*//' | cut -d"/" -f1-5 | unew -el -t -q data/Yeswehack/yeswehack_github_repo_inscope.txt
cat arkadiyt/bounty-targets-data-main/data/yeswehack_data.json | jq -r '.[].targets.out_of_scope[].target' | grep "^https://github.com" | awk '{print $1}' | sed -e 's/\/\*$//' -e 's/\/$//' -e 's/#.*//' | cut -d"/" -f1-5 | unew -el -t -q data/Yeswehack/yeswehack_github_repo_outofscope.txt

# Wildcards
cat data/Bugcrowd/bugcrowd_inscope.txt data/Hackerone/hackerone_inscope.txt data/Intigriti/intigriti_inscope.txt data/Yeswehack/yeswehack_inscope.txt | grep "*" | unew -el -t -i -q data/Wildcards/inscope_wildcards.txt
cat data/Bugcrowd/bugcrowd_outofscope.txt data/Hackerone/hackerone_outofscope.txt data/Intigriti/intigriti_outofscope.txt data/Yeswehack/yeswehack_outofscope.txt | grep "*" | unew -el -t -i -q data/Wildcards/outofscope_wildcards.txt

# Domains
cat data/Bugcrowd/bugcrowd_inscope.txt data/Hackerone/hackerone_inscope.txt data/Intigriti/intigriti_inscope.txt data/Yeswehack/yeswehack_inscope.txt | grep -v "*" | unew -el -t -i -q data/Domains/inscope_domains.txt
cat data/Bugcrowd/bugcrowd_outofscope.txt data/Hackerone/hackerone_outofscope.txt data/Intigriti/intigriti_outofscope.txt data/Yeswehack/yeswehack_outofscope.txt | grep -v "*" | unew -el -t -i -q data/Domains/outofscope_domains.txt

# Github Repo
cat data/Bugcrowd/bugcrowd_github_repo_inscope.txt data/Hackerone/hackerone_github_repo_inscope.txt data/Intigriti/intigriti_github_repo_inscope.txt data/Yeswehack/yeswehack_github_repo_inscope.txt | unew -el -t -q data/GithubRepo/inscope_github_repo.txt
cat data/Bugcrowd/bugcrowd_github_repo_outofscope.txt data/Hackerone/hackerone_github_repo_outofscope.txt data/Intigriti/intigriti_github_repo_outofscope.txt data/Yeswehack/yeswehack_github_repo_outofscope.txt | unew -el -t -q data/GithubRepo/outofscope_github_repo.txt

# Generating Last Update data
cat data/Wildcards/inscope_wildcards.txt | unew -el -t -i old_data/Wildcards/inscope_wildcards.txt | unew -el -t -i -q data/NewData/newdata_inscope_wildcards.txt && [ ! -s data/NewData/newdata_inscope_wildcards.txt ] && cat old_data/NewData/newdata_inscope_wildcards.txt | unew -el -t -i -q data/NewData/newdata_inscope_wildcards.txt
cat data/Domains/inscope_domains.txt | unew -el -t -i old_data/Domains/inscope_domains.txt | unew -el -t -i -q data/NewData/newdata_inscope_domains.txt && [ ! -s data/NewData/newdata_inscope_domains.txt ] && cat old_data/NewData/newdata_inscope_domains.txt | unew -el -t -i -q data/NewData/newdata_inscope_domains.txt
cat data/GithubRepo/inscope_github_repo.txt | unew -el -t old_data/GithubRepo/inscope_github_repo.txt | unew -el -t -q data/NewData/newdata_inscope_github_repo.txt && [ ! -s data/NewData/newdata_inscope_github_repo.txt ] && cat old_data/NewData/newdata_inscope_github_repo.txt | unew -el -t -q data/NewData/newdata_inscope_github_repo.txt

cat data/Wildcards/inscope_wildcards.txt data/Domains/inscope_domains.txt | unew -el -t -i -q data/inscope.txt
cat data/Wildcards/outofscope_wildcards.txt data/Domains/outofscope_domains.txt | unew -el -t -i -q data/outofscope.txt

# Deleting downloaded data
rm -rf arkadiyt old_data
