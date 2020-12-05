#!/bin/bash

# create a multiline variable
function multilineVars() {
	fname="$1"
	lname="$2"
	full="$fname $lname"

	if [ ! -z "$full" ]; then
		echo "processing $full"
		# create multiline variable
		card="firstname: $fname
lastname: $lname
fullname: $full
summary: 4"
		if [ "1" = "2" ]; then
			echo this line is never covered
		elif [ ! -z "$card" ]
		then
			echo "$card"
		else
			echo this line is never covered
		fi
	else
		echo this line is never covered
	fi
}

# eval some multiline variable
function multilineEvalHeredoc() {
	cmd=$1
	if [ "1" = "2" ]; then
		echo this line is never covered
	fi
	read -r -d '' func <<- EOF
		ainc=\$(( \$a + 1 ))
		binc=\$(( \$b + 1 ))
		echo -n $cmd \$a \$b:
		$cmd \$a \$b
		echo -n $cmd \$a+1 \$b+1:
		$cmd \$ainc \$binc
	EOF
	if [ "1" = "2" ]; then
		echo this line is never covered
	fi
	eval "
		a=$2
		b=$3
		$func
	"
	if [ "1" = "2" ]; then
		echo this line is never covered
	fi
}


# eval some multiline variable
function multilineEval() {
	cmd=$1
	if [ "1" = "2" ]; then
		echo this line is never covered
	fi
	func="ainc=\$(( \$a + 1 ))
binc=\$(( \$b + 1 ))
echo -n $cmd \$a \$b:
$cmd \$a \$b
echo -n $cmd \$a+1 \$b+1:
$cmd \$ainc \$binc"
	if [ "1" = "2" ]; then
		echo this line is never covered
	fi
	echo "obfuscate" > /dev/null && eval "
		a=$2
		b=$3

		$func
	"
	if [ "1" = "2" ]; then
		echo this line is never covered
	fi
}

# execute code with split lines
function multilineCommands() {

	echo some string | sed \
		-e s/some/result/ \
		-e s/string/ok/

	if [ "1" = "1" ]; then
		echo this line is always covered > /dev/null
	else
		echo this line is never covered
	fi

}

