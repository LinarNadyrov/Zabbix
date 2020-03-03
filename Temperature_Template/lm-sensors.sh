#!/bin/sh

command="sensors"

case "$1" in
 discovery)
  echo '{"data":['
  $command | awk -v comma="$comma" '($1 ~ ".*:" && $2 ~ "\+*[0-9]"){
	item=substr($1,0,index($1,":"));
	n=$2+0.0;
	if (comma=="yes") sub("\.",",",n);
	if (sub(".*(high|crit) = ","")) crit=$0+0.0;
	else crit=0;
	if (npar++>0) print ",";
	printf("{ \"{#SENSOR}\":\"" item "\", \"{#CRIT}\":\"" crit "\" }");
  }' 2>/dev/null
  echo
  echo ']}'
  ;;
 *)
  $command | awk -v param="$1" -v comma="$comma" '($1 ~ ".*:" && $1 ~ "^"param":*$" && $2 ~ "\+*[0-9]"){
	n=$2+0;
	if (comma=="yes") sub("\.",",",n);
	print n;
	exit;
  }' 2>/dev/null
  ;;
esac
