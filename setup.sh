#!/bin/bash

DOR_FILES=(.vimrc .bashrc .inputrc)

for file in ${DOR_FILES[@]}
do
	ln -sfnv $HOME/dotfiles/$file $HOME/$file
	#echo $HOME/dotfiles/$file $HOME/$file
done


