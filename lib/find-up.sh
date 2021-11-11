#!/bin/bash

# Public: Find the first instance of a given file by crawling up the current working directory path.
#
# Takes a single argument, the name of a file and searches each parent directory until a file of that name is found.
#
# $1 - the name of the file.
#
# Examples
#
#   find-up ".bubblerc"
#
# Returns the path of the file or ""
find-up () {
  # start with the current working directory
  path=$(pwd)

  # Loop 'up' until the filename $(1) exists (-e) in the path
  while [[ "$path" != "" && ! -e "$path/$1" ]];
	do
    path=${path%/*}
  done

  # Return the final path an filename 
	echo "$path/$1"

}