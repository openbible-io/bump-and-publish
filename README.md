# bump-and-publish

Makes git the source of truth for versions while still allowing manual tags.

## Versioning
Tag order:
- Commit tag
- Minor bump of previous tag


## Packaging
Sets `version` and `openbible.published` with the current date in `package.json`.

## Publishing
Pushes tag and runs `npm publish` with provenance.
