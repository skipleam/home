# Home

git, bash, etc.

## Installation
This repo should sit in the home directory. The provided `.gitignore` will prevent other random files from being added. As such, any new files intended to be included must be force added (`git add -f filename`).

## Bash Aliases
Aliases are organized into individual files per use case in the `.aliases` folder, e.g. `.aliases/acme.bashrc_aliases`.

That folder is loaded dynamically from `.bashrc_aliases`, so simply add a new file in that folder named `*.bashrc_aliases`.
