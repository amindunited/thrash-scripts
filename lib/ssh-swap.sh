#!/bin/bash

# Public: List and select from Public Keys, Remove SSH entries and add the selected one.
#
# Takes a single argument, the name of an RSA Pub file.
#
# $1 - the name of the file.
#
# Examples
#
#   ssh-swap id_rsa_work
#
# Returns void
ssh-swap () {

  fileListArray=()
  while IFS=  read -r -d $'\0'; do
      # fileListArray+=("$REPLY")
      # Removes the ".pub" extension from the file name
      # Because we will be registering the private key, not the public one
      fileListArray+=("${REPLY%.pub}")
  done < <(find ~/.ssh -type f -name "*.pub" -print0)

  echo "Which id would you like to use?"
  select idFile in "${fileListArray[@]}"; do
    case $idFile in
      *)
        echo "you selected: ${idFile}"
        break
        ;;
    esac

  done

  # removes all ssh entries from the ssh-agent
  ssh-add -D

  # Adds the given ssh key pub ($1)
  ssh-add "${idFile}"
}
