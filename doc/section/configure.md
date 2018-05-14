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

