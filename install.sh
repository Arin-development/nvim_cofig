#!/bin/bash

cp -r ./nvim ~/.config/

mkdir ./hack
unzip ./Hack.zip -d ./hack
mv ./hack ~/.fonts
fc-cache -fv
