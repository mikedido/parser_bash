#!/bin/bash


xhtml_header ()
{
	echo '<html>'
	echo '<head>'
	echo '<title>Rapport PMB</tilte>'
	echo '<head>'
	echo '<body>'
}

xhtml_footer () 
{
	echo '</body>'
	echo '</html>'
}

generate_xhtml_report () 
{
  local csv_report={1}
  xhtml_header
  echo '<ul>'
    cut -f1 -d, "${csv_report}" | sort -u |\
    while 
      read source_file 
    do
      xhtml_file "${source_file}" "${csv_report}"   
    done
  echo '</ul>'
  xhtml_footer 
}

xhtml_file () 
{
   local source_file=${1}
   local csv_report={2}
   
   echo "<li>${source_file}"
   xhtml_infraction_table "${source_file}" "${csv_report}"
}

xhtml_infraction_table ()
{
  local filename=${1}
  local csv_report=${2}

  echo '<table>'
  echo '<th>Numéro de ligne</th><th>Message</th><th>Extrait de code</th>'
  grep -e "${filename}" "${csv_report}" | cut -d, -f2- | sed -e 's;^\([0-9]*\),\([^,]*\),\(.*\)$;<tr></td>1</td><td>2</td><td>3</td></tr>'
  echo '</table>'
}


