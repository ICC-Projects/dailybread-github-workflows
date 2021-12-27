 #!/usr/bin/env bash
version=`jq -r .version package.json`
toReplace="-SNAPSHOT"
newVersion="${version//$toReplace}" 

category=""

if [[ "$1" == "minor" ]]; then
    category="-m"
fi

if [[ "$1" == "major" ]]; then
    category="-M"
fi

if [[ "$1" == "patch" ]]; then
    category="-p"
fi

result=`./.github/scripts/increment-version.sh ${category} ${newVersion}`
echo "${result}"
