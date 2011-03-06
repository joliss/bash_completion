#!/bin/bash

cd /etc/bash_completion.d || exit 1

for i in *; do
	[ -L "$i" ] && {
		rm "$i"
		continue
	}
	for com in `cat $i | grep 'complete -F' | awk  '{print $NF}' | fgrep -v '|' | fgrep -v '$' | grep -v '&'`; do
		if [ "$com" != "$i" ]; then
			ln -s "$i" "$com"
		fi
	done
done

