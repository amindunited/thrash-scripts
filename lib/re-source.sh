#!/bin/bash

source ./find-up.sh

# Public: Find the given file in the nearest parent directory, and `source` it.
#
# Takes a single argument, the name of a file.
#
# $1 - the name of the file.
#
# Examples
#
#   re-source ".bashrc"
#
re-source () {

  # Use 'find-up' to search for the nearest instance of the file ($1)
	rc=$(find-up "$1")

  # If an instance of the file was found...load it.
	if [ -e "$rc" ]
	then
    echo "re-source is adding $rc"
		source "$rc"
	fi
}