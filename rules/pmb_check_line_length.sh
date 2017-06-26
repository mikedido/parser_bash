#!/bin/bash

pmb_check_line_number ()
{
	local source_file=${1}
  local length=${PWD_LENGTH_LINE:-120}  
	#echo "${1}"
  #echo ${length}
  local i=0

  cat ${source_file} |
  while read line
	do
		if [ -n "$line" ]; then
			nb=`echo ${line} | wc -c`
			if [ "${nb}" -gt "${length}" ]; then
				echo "La ligne $i depasse la limite" 
			fi
			let "i++"
		fi
	done
}


pmb_check_line_number ${1}
