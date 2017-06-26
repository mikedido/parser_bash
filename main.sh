#!/bin/bash


usage () 
{

	echo '$(basename ${1} [-r][-h])'

}




while getopts ":hr" OPT
do
	case $OPT in 
	h)
		usage 
		;;

	r)
		echo 'MAIN'
		;;
	*) usage
	 ;;
	esac
done
