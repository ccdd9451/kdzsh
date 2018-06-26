#!/bin/bash

if [[ $1 = "-r" ]]; then
    bash ./tools/revert.sh
fi

if [[ ! -n $ZSH ]]; then
    echo "Is oh-my-zsh installed in this machine?"
    echo 'Please install zsh first, then run command:
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
    exit 1
fi

echo "Installing custom packages..."

ZSHRC_OLD=$HOME/.zshrc
ZSHRC=$HOME/.oh-my-zshrc 
KDZSH="$( cd "$( dirname "$0" )" && pwd )"

if [[ ! -e $ZSHRC ]]; then
    mv $ZSHRC_OLD $ZSHRC
    echo "source $ZSHRC" >$ZSHRC_OLD 
    echo "append_zshrc() { echo \$* >>"$ZSHRC_OLD" }" >> $ZSHRC_OLD
else
    echo "WARNING: .oh-my-zshrc exists"
    echo "           ... do you want to revert first?"
fi

# Add personal configurations
sed -ri "/ZSH_CUSTOM=/ cZSH_CUSTOM=$KDZSH/custom" $ZSHRC
# Customize Plugins
sed -ri "/plugins=\($/,/\)$/ {
  /[\(\)]/b; 
  c\   web-search wd dangerous
  }" $ZSHRC
# Fix language setting to en_US.UTF-8
sed -ri "/\#.+LANG/ s/..//" $ZSHRC  
sed -ri "/LANG=/ {p;s/LANG/LC_CTYPE/}" $ZSHRC  
