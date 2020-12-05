#!/bin/bash

function add() {
	a=$1
	a1=$(( $a + 1 ))
	b=$2
	b1=$(( $b - 1 ))
	echo $(( $a + $b ))
}

function sub() {
	a=$1
	a1=$(( $a + 1 ))
	b=$2
	b1=$(( $b - 1 ))
	echo $(( $a - $b ))
}

function translateToUpper() {
	while [ "$#" -gt 0 ]; do
		a="$(echo "$1" | tr "a-z" "A-Z")"
		if [ "$a" = "FAILED" ]; then
			echo "ERROR"
		else
			concat=
			while IFS= read -r line; do
				echo -n $concat"$line"
				concat="|"
			done < <(echo "$a")
			echo
		fi
		shift
	done
}

