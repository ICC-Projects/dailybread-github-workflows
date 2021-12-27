GH_TOKEN=${1:?Please specify the github token as 1st arg}
CI_COMMIT_TAG=${2:?Please specify the version as 2nd arg (e.g. 1.0.0)}

RELEASE_ID=$(curl -sL https://osef:${GH_TOKEN}@api.github.com/repos/${GITHUB_REPOSITORY}/releases | jq -r ". | map(select(.tag_name == \"${CI_COMMIT_TAG}\")) | map(.id) | .[]")
curl -X DELETE https://osef:${GH_TOKEN}@api.github.com/repos/${GITHUB_REPOSITORY}/releases/${RELEASE_ID}
git push --delete origin ${CI_COMMIT_TAG}
