 #!/usr/bin/env bash

echo "Validating release category..."

RES="false"

if [[ "$1" == "minor" ]]; then
    RES="true"
fi

if [[ "$1" == "major" ]]; then
    RES="true"
fi

if [[ "$1" == "patch" ]]; then
    RES="true"
fi

if [[ "$RES" == "false" ]]; then
    echo "No match found for release category '${1}'"
    exit 1
fi
echo "Release category '${1}' found and validated"
exit 0
