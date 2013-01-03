#!/bin/sh

pwd=`pwd`

for i in `ls -A src`; do
    basename=`basename $i`
    rm -f $HOME/$basename
    target="$pwd/src/$i"
    name="$HOME/$i"
    echo "Linking $target to $name"
    ln -s $target $name
done
