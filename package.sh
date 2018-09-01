#!/usr/bin/env bash

dependencies \
  projector ./src/projector.sh

build() {
  mkdir -p ./dist
  bake bundle src/projector_bash.bake > ./dist/projector_bash
  bake bundle src/projector_zsh.bake > ./dist/projector_zsh
}
