#!/usr/bin/env bash

set -eu

[[ -d out ]] && rm -r out

mkdir -p out/

modname="$(jq -r .name <info.json)"
modversion="$(jq -r .version <info.json)"

mkdir "out/$modname"

git ls-files --cached -z | xargs -0 cp -t "out/$modname"

(cd out; zip -r "${modname}_${modversion}.zip" "$modname")

echo out/$modname

rm -r "out/$modname"