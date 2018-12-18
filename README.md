# dir-abbr-fish

Load and unload a `.abbr` file when entering and leaving directories.

## Install

Install as a fisherman plugin

```
fisher add rcoedo/dir-abbr-fish
```

## Functions

| function                       | Description                                                |
| ------------------------------ | ---------------------------------------------------------- |
| `dir-abbr-list`                | List loaded abbreviations.                                 |
| `dir-abbr-reload`              | Reload .abbr file for the current directory.               |

## Example of a `.abbr` file

```
init=rm -rf node_modules/; and yarn; and yarn compile
run=yarn run
test=yarn test
lint=yarn lint
```
