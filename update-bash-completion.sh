#!/bin/bash

cd /etc/bash_completion.d || exit 1

for i in *; do
	[ -L "$i" ] && rm "$i"
done

for i in *; do
	for com in `cat $i | grep 'complete -F' | awk  '{print $NF}' | fgrep -v '|' | fgrep -v '$' | grep -v '&'`; do
		if [ "$com" != "$i" ]; then
			echo "$com -> $i"
			ln -s "$i" "$com"
		fi
	done
done

