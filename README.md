# bump-and-publish

If pushed commit has a tag, will publish it. Otherwise will bump the previous tag. Will push.

Then will set `version` and `openbible.published` with the current date in `deno.json`.

Then runs `deno publish`.

This makes git the source of truth for versions.
