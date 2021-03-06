#! /bin/bash
noop=0
prefix=""
repo=$(pwd)
[[ $# -eq 0 ]] && { echo "usage ./install.sh [-t|--test] -p|--prefix /prefix/path"; exit 1; }

while [[ $# -gt 0 ]]
do
	key=$1
	case $key in
		-t|--test)
			noop=1
			;;
		-p|--prefix)
			prefix="$2"
			shift
			;;
		*)
			echo "usage ./install.sh [-t|--test] -p /prefix/path.."
			exit 1
			;;
	esac
	shift
done

[[ $noop -eq 1 ]] && echo "Not performing any operation"

for i in $(ls -a)
do
	[[ "$i" = "install.sh" || "$i" = ".gitignore" || ! -f "$i" || -e "${prefix}/$i" || "$i" == "README.md" ]] && continue
	echo "${prefix}/$i -> ${repo}/$i";
	[[ $noop -eq 0 ]] && ln -sf ${repo}/$i ${prefix}/$i;
done

echo "${prefix}/.vim -> ${repo}/.vim"
echo "${prefix}/.config/terminator/config -> ${repo}/.config/terminator/config"
echo "${prefix}/.oh-my-zsh/themes/sushant.zsh-theme ${repo}/.oh-my-zsh/themes/sushant.zsh-theme"

if [[ $noop -eq 0 ]]; then
	mkdir -p ${prefix}/.config/{terminator,i3}
	ln -sf ${repo}/.vim ${prefix}/.vim
	ln -sf ${repo}/.config/terminator/config ${prefix}/.config/terminator/config
	ln -sf ${repo}/.oh-my-zsh/themes/sushant.zsh-theme ${prefix}/.oh-my-zsh/themes/sushant.zsh-theme

	ln -sf ${repo}/.oh-my-zsh/themes/maran2.zsh-theme ${prefix}/.oh-my-zsh/themes/maran2.zsh-theme

	ln -sf ${repo}/.config/i3/config ${prefix}/.config/i3/config
	ln -sf ${repo}/.i3status.conf ${prefix}/.i3status.conf
	wget 'https://www.dropbox.com/s/f293v4w310inrut/stardict.tgz?dl=0' -O stardict.tgz
	tar -xvf ${repo}/stardict.tgz -C ${prefix}
fi
