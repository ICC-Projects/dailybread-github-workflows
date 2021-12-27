 #!/usr/bin/env bash
OS_USED=$(uname -s)

NEW_VERSION=${1:?Please specify the new version as 1st arg (e.g. 1.0.0)}

# Sed on OSX expects a suffix to create the backup of the files.
# Sed on Linux does not understand an empty suffix.

jq '.version="'${NEW_VERSION}'"' package.json > package.json.new
mv package.json.new package.json
