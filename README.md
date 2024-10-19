# bump-and-publish

Makes git the source of truth for versions while still allowing manual tags.

## Versioning
If pushed commit has a tag uses it.
Otherwise bumps previous tag.

Will always push tag.

## Packaging
Sets `version` and `openbible.published` with the current date in `deno.json`.

## Publishing
Runs `deno publish`.
