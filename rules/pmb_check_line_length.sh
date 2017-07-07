#!/bin/bash

###########################################################################################
# pmb: cette règle vérifie qu'aucune ligne du script ne dépasse la taille maximum autorisée.
############################################################################################

pmb_check_line_length ()
{
  local source_file=${1}
  local length=${PWD_LENGTH_LINE:-120}  
  local i=0

  cat ${source_file} |
  while read line
    do
      if [ -n "$line" ]; then
	line_length=`echo ${line} | wc -c`
	  if [ "${line_length}" -gt "${length}" ]; then
            echo "${source_file},${i},La ligne numéro ${i} depasse la limite est plus longue que ${length},${line}" 
	  fi
        let "i++"
      fi
     done
}


#pmb_check_line_number ${1}
