# dir-abbr-fish

Load and unload a `.abbr` file when entering and leaving directories.

## Install

Install as a fisherman plugin

```
fisher rcoedo/dir-abbr-fish
```

## Example of a `.abbr` file

```
init=rm -rf node_modules/; and yarn; and yarn copy-resources; and yarn compile
run=yarn run
test=yarn test
lint=yarn lint
```
