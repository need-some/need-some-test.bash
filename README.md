# need-some-test.bash
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Version: 0.0.1](https://img.shields.io/badge/version-0.0.1-yellowgreen)](0.0.1)
[![need-some-test.bash](https://img.shields.io/badge/need--some-test-ff69b4.svg?logo=github&logoColor=white)](https://github.com/need-some/need-some-test.bash)

_need-some_ is a collection of small yet useful functions.

the test package contains methods to unit test bash scripts

## Installation
See the Installation in [need-some-init.bash](https://github.com/need-some/need-some-init.bash "need-some-init.bash")

## Usage
Call bashunit from a bash

	bashunit [--nocoverage] dir|file...

if called with directory, all files matching *.bashunit are searched

--nocoverage skips code coverage report, and increases speed

## Syntax
bashunit uses standard bash syntax, each function in a bashunit file is executed as a test.
Code outside of methods is executed randomly, so generic initialization or de-initialization code should be placed in the before and after methods

### Annotations
Annotations can be used within test functions to control execution of the test

| @testName "name" | Override testname |
| @skip | don't execute this function, but count it as skipped test |
| @noTest | don't execute this function and don't record it |
| @parameters "a" "b" "c"... |  Call test function with given positional parameters. If used multiple times, the test function is called for each parameter set as individual test |

### shebang
A shebang is ignored, to make test files self-executing, a dynamic shebang like

	#!/usr/bin/env bashunit

can be used.

### Assertions
Currently bash test syntax is used for assertions:

	assert "description" $result -eq 2

# Examples

	function success-assert() {
		@testName "successful assert on method call"
		result=$(add 1 1)
		expected=2
		assert "equal" $expected -eq $result
	}

# Open points
- Create before and after annotations instead of hard coded method names
