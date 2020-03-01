# Projector

[![Build Status](https://travis-ci.org/bas080/projector.svg?branch=master)](https://travis-ci.org/bas080/projector)

Project specific bash scripts.

## Reasoning

Usually I find myself needing bash commands for specific projects,
usually for compilation, working with git, etc. Projector allows
you to define a project specific bash file.

## Installation

> It's also possible to download a specific version by replacing `master` with
> a valid version.

The intention is to source the shell specific version of projector.

### Bash

```sh
wget -O ~/.projector_bash https://raw.githubusercontent.com/bas080/projector/master/dist/projector_bash
echo 'source ~/.projector_bash' >> ~/.bashrc
```

### Zsh

```sh
wget -O ~/.projector_zsh https://raw.githubusercontent.com/bas080/projector/master/dist/projector_zsh
echo 'source ~/.projector_zsh' >> ~/.zshrc'
```
## Instructions

### ./.local.bashrc

Define a file in your project root called `.local.bashrc`. An example:

```bash
#!/bin/bash

alias clean='cd $PROJECTOR_HOME && rm -rf _build'
alias compile='rebar3 compile'
alias recompile='clean && compile'
```

The `$PROJECTOR_HOME` variable contains the path of the last sourced
`.local.bashrc` file. This allows one to run commands without being in the home
directory of the project.

A new shell process is spawned whenever you change into the local directory. It
will source the default rc files and the `.local.<shell>rc`.

```
$ cd my/project/dir
$ recompile
# ...
```
## Contributors

- [Antonis Kalou](https://github.com/kalouantonis)
- [Bas Huis](https://github.com/bas080)

## Roadmap

1. Make projector work for **zsh**.
2. Start a cookbook so people can share handy tricks.
3. Find people that are interested and would like to make this project better.

## License

MIT, see [LICENSE](LICENSE) file.
