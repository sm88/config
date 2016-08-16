#! /bin/bash
! [[ $# -eq 1 ]] && { echo "Usage $0 prefix"; exit 1; }
! [[ -e "$1" ]] && { echo "$1 does not exist"; exit 2; }
repo=$(pwd)
prefix=$1
for i in $(ls -a)
do
	[[ "$i" = "install.sh" || "$i" = ".gitignore" || ! -f "$i" || -e "${prefix}/$i" ]] && continue
	echo "${prefix}/$i -> ${repo}/$i";
	ln -sf ${repo}/$i ${prefix}/$i;
done
ln -sf ${repo}/.vim ${prefix}/.vim
ln -sf ${repo}/.config/terminator/config ${prefix}/.config/terminator/config
ln -sf ${repo}/.oh-my-zsh/themes/sushant.zsh-theme ${prefix}/.oh-my-zsh/themes/sushant.zsh-theme
