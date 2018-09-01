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
