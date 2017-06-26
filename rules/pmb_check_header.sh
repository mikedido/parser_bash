#!/bin/bash


readonly HEADER_FILE=''

pmb_check_header ()
{
	local source_file=$1
	local header=${HEADER_FILE:-'#!/bin/bash'}

	result=`cat ${source_file} | head -1`
	
	if [ "$result" != "${header}" ]; then
		echo "The ${source_file} don't begin with header : ${header}"
	fi
}

pmb_check_header $1
