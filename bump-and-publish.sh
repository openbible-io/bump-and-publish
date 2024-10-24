#!/bin/env bash
set -e

git fetch --tags
VERSION=$(git describe --tags --match="v[0-9]*.[0-9]*.[0-9]*" --abbrev=0 HEAD)
if [[ -z $VERSION ]]; then
	VERSION=$(git tag --sort=committerdate | tail -1)
	echo "No manual tag, bumping $VERSION"
	VERSION=$(echo ${VERSION:=v0.0.0} | awk -F. -v OFS=. '{$NF += 1 ; print}')
	git tag $VERSION
	git push --tags origin master
fi
cat deno.json | jq ".openbible.published = \"$(date +%Y-%m-%d)\" | .version = \"${VERSION:1}\"" > deno.json
deno publish --allow-dirty
