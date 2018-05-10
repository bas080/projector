# Projector

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

# Configure

It is possible to configure projector to look for a different path besides
`.project_bash` or `projector_bin`. Many people store their project scripts in
a directory named script(s). But that doesn't have to be the case. Projector
allows you to define this yourself.


## Configuring source file path

When installing projector, the install scripts adds the following to your
`~/.bashrc` and/or `~/.zshrc`. `source ~/.projector_bash` for the bashrc and
`source ~/.projector_zsh` for the zshrc. To change the name of the source file
projector looks for we can assign a different value to the
`PROJECTOR_SOURCE_PATH` variable.

```sh
source ~/.projector_bash
PROJECTOR_SOURCE_PATH='.projectorrc'
```

From now on, whenever we navigate to a file that contains a `.projectorrc`
file, it will start sourcing that file.

The most important part here is to realise is that you are only required to
assign a new value to the `PROJECTOR_SOURCE_PATH` variable in order to
configure.

## Configuring bin directory path

Same here, we basicly change the value of `PROJECTOR_BIN_PATH` from
`projector_bin` to a name that better suits our needs.

I have noticed that depending on the project, the location of a scripts
directory differs. If that's the case I configure the `PROJECTOR_BIN_PATH` in
the `.projector_bash` file.

## Contributors

- [Antonis Kalou](https://github.com/kalouantonis)
- [Bas Huis](https://github.com/bas080)

## License

MIT, see [LICENSE](LICENSE) file.

