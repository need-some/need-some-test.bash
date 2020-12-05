#!/bin/bash

if [ "$1" = "add" ]; then
	shift
	a=$1
	a1=$(( $a + 1 ))
	b=$2
	b1=$(( $b - 1 ))
	echo $(( $a + $b ))
elif [ "$1" = "sub" ]; then
	shift
	a=$1
	a1=$(( $a + 1 ))
	b=$2
	b1=$(( $b - 1 ))
	echo $(( $a - $b ))
else
	echo "add|sub a b"
	exit 99
fi
