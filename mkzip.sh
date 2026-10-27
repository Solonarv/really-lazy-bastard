#!/usr/bin/env bash

set -eu

[[ -d out ]] && rm -r out

mkdir -p out/

modname="$(jq -r .name <info.json)"


git ls-files --cached | zip -@ out/$modname.zip

echo out/$modname