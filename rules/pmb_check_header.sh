#!/bin/bash

###############################################################################
# pmb: cette règle vérifier si le script commence bien par l'entête #!/bin/bash
###############################################################################

readonly HEADER_FILE=''

pmb_check_header ()
{
	local source_file=${1}
	local header=${HEADER_FILE:-'#!/bin/bash'}

	result=`cat ${source_file} | head -1`
	
	if [ "$result" != "${header}" ]; then
		echo "${source_file},1,le fichier ${source_file} ne commence pas avec l'entête : ${header}, ${result}"
	fi
}

#pmb_check_header $1
