GH_TOKEN=${1:?Please specify the github token as 1st arg}
CI_COMMIT_TAG=${2:?Please specify the version as 2nd arg (e.g. 1.0.0)}
CI_COMMIT=$(git rev-parse HEAD)

echo "${GITHUB_REPOSITORY}"
echo "${GH_TOKEN}"
echo "${CI_COMMIT_TAG}"
echo "${CI_COMMIT}"

curl \
  -X POST \
  -H "Accept: application/vnd.github.v3+json" \
  https://osef:${GH_TOKEN}@api.github.com/repos/${GITHUB_REPOSITORY}/releases \
  -d '{"name":"'${CI_COMMIT_TAG}'", "tag_name":"'${CI_COMMIT_TAG}'", "target_commitish":"'${CI_COMMIT}'", "prerelease":false, "draft":false}'
