#!/bin/bash

echo "Revert .zshrc from OMZ..."
rm $HOME/.oh-my-zshrc
cp $ZSH/templates/zshrc.zsh-template $HOME/.zshrc
