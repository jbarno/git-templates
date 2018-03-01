#!/bin/bash

echo "Setting up globalgitignore"
cp gitignore ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

cur_dir=$(pwd)
echo "Setting global git template"
git config --global init.templatedir $cur_dir
workdir=$1
if [ -z $workdir ]; then
    echo "Please provide a work directory"
    exit 1
fi
echo "Updating existing repositories to latest template"
for d in $workdir/*/; do
    # Will print */ if no directories are available
    cd "$d"
    if [ -d .git ]; then
        git init --template $cur_dir
    fi
done
cd $cur_dir
