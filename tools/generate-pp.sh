#!/bin/bash

generate()
{
	FILENAME="../pp/privacy-policy-$1.html"
	APPNAME=$2
	
	[ "$3" = "os" ] && TYPE="Open Source"
	[ "$3" = "opensource" ] && TYPE="Open Source"
	[ "$3" = "free" ] && TYPE="Free"
	
	echo "Generating Privacy Policy HTML"
	echo "File: $FILENAME"
	echo "Name: $APPNAME"
	echo "Type: $TYPE"
	
	sed -e "s/__APPNAME__/$APPNAME/" < base.html | sed -e "s/__TYPE__/$TYPE/" > "$FILENAME"
}

parseline()
{
	IFS='|'
	readarray ITEM <<< $1
	generate ${ITEM[0]} ${ITEM[1]} ${ITEM[2]}
}

main()
{
	IFS="|"
	cat list.txt | while read -a line; do
		generate "${line[0]}" "${line[1]}" "${line[2]}"
	done
	
	unset IFS
}

main "$@"
