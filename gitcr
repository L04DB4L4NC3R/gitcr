#!/bin/bash


# Importing functions
. ./functions/config.sh
. ./functions/create.sh
. ./functions/revert.sh
. ./functions/manual.sh


cli(){
	case $1 in 
		create)
			create $@
			;;
		help)
			helpFunc
			;;
		revert)
			revert $@
			;;

		*)
		helpFunc
 		;;
	esac
}


cli $@
