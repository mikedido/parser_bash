#!/bin/bash

source_file=${1}
REPORT_CSV="rapport.csv"

#####################
#usage du script 
#####################
usage () 
{
  echo '$(basename ${1} [-r][-h])'
  exit 1
}

##############################################
#Vérification du répertoire des règles
#############################################
readonly RULES_HOME="$(pwd)/rules"

if [ ! -d ${RULES_HOME} ]; then
  echo "La valeur ${RULES_HOME} n'indique pas l'emplacement d'un répertoire"
  exit 1
fi

#############################
#chargement des règles
#############################
for rule in "${RULES_HOME}"/*
do 
  echo "Loading rule : ${rule}"
  source "${rule}"
done


###################################
#Gestion des options
###################################
while getopts "hr:" OPT
do
  case ${OPT} in 
  h)
    usage 
    ;;

  r)
    readonly REPORT_FILE="${OPTARG}"
    if [ ! -w "${REPORT_FILE}" ]; then
      echo "Impossible d'écrire le rapport dans le fichier ${REPORT_FILE}."
      usage
      exit 4
    fi 
    ;;
  *) 
    echo "$(basename ${0}) ne reconnaît pas cette option ${OPT}"
    usage
    exit 5
    ;;
  esac
done

#############################
#éxécution des règles
############################
for rule in $(ls -1 "${RULES_HOME}"/*) 
do 
  #for source_file in ${SOURCES_ROOT_DIR}
  #do
	$(basename --suffix .sh  "$rule") "${source_file}" >> "${REPORT_CSV}"
  #done
done

##################################
#Génération du rapport
##################################


#################################
#Delete the report.csv
################################
