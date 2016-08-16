#! /bin/bash
! [[ $# -eq 1 ]] && { echo "Usage $0 prefix"; exit 1; }
! [[ -e "$1" ]] && { echo "$1 does not exist"; exit 2; }
repo=$(pwd)
prefix=$1
for i in $(ls)
do
	[[ "$i" = "install.sh" ]] && continue
	{ echo ${prefix}/$i; ln -sf ${repo}/$i ${prefix}/$i; }
done

