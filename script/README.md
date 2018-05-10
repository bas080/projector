> These scripts should be run from the project directory. `./script/<script>`

# install

Allows one to download the projector project from the remote git repository.
Requires an internet connection.

You can pass a git tag semver version as an option. An example would be
`./script/install 0.1.0`

# publish

Used to publish a new version of projector. It creates a git tag and pushes it
to the remote. `./script/publish 0.1.0`

# tests

This file contains the tests. You can run them by typing `./script/tests`.

# docs

Projector's README.md is generated using the files located in the `./doc`
directory. The `./script/docs` scripts tests if the docs and doc examples are
working as expected and then generates the `./README.md`
