#! /bin/bash
! [[ $# -eq 2 ]] && { echo "Usage $0 reponame prefix"; exit 1; }
! [[ -e "$1" ]] && { echo "$1 does not exist"; exit 2; }
! [[ -e "$2" ]] && { echo "$2 does not exist"; exit 3; }
repo=$1
prefix=$2
for i in $(ls repo)
do
	[[ -f ${prefix}/$i ]] && ln -sf ${repo}/$i ${prefix}/$i
done

