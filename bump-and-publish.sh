#!/bin/env bash
set -e

TAG_CMD="git describe --tags --abbrev=0 --match=v[0-9]*.[0-9]*.[0-9]*"

git fetch --tags
VERSION=$($TAG_CMD --exact-match 2>/dev/null || true)
if [[ -z $VERSION ]]; then
	VERSION=$($TAG_CMD 2>/dev/null || echo 'v0.0.0')
	echo "No manual tag, bumping $VERSION"
	VERSION=$(echo $VERSION | awk -F. -v OFS=. '{$NF += 1 ; print}')
	git tag $VERSION
	git push --tags origin master
fi
echo "Publishing $VERSION"
cat package.json | jq ".openbible.published = \"$(date +%Y-%m-%d)\" | .version = \"${VERSION:1}\"" > package.json
env
bun publish --access public --provenance
