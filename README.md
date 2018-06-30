# Projector

[![Build Status](https://travis-ci.org/bas080/projector.svg?branch=master)](https://travis-ci.org/bas080/projector)

Project specific bash scripts.

## Reasoning

Usually I find myself needing bash commands for specific projects,
usually for compilation, working with git, etc. Projector allows
you to define a project specific bash file.

## Installation

```sh
curl https://raw.githubusercontent.com/bas080/projector/master/script/install | bash
```

```sh
git clone https://github.com/bas080/projector && \
  cd projector && \
  ./script/install
```

## Instructions

### ./.bash_project

Define a file in your project root called `.bash_project`. An example:

```bash
#!/bin/bash

alias clean='cd $PROJECT_HOME && rm -rf _build'
alias compile='rebar3 compile'
alias recompile='clean && compile'
```

The `$PROJECT_HOME` variable contains the path of the last sourced
`.bash_project` file. This allows one to run commands without being in the home
directory of the project.

Every time you change directory in to your project root the `.bash_project`
file will be sourced and your commands will be available.

```
$ cd my/project/dir
$ recompile
# ...
```

### ./projector_bin

Another feature is the ability to put executable scripts in the `projector_bin`
directory.

The `projector_bin` path is added to the `PATH` variable when in the project or
it's child directories. The `projector_bin` path is removed from `PATH` when
leaving the project directory.

## Contributors

- [Antonis Kalou](https://github.com/kalouantonis)
- [Bas Huis](https://github.com/bas080)

## License

MIT, see [LICENSE](LICENSE) file.
