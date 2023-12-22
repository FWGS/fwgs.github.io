#!/bin/sh

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

main()
{
	IFS="|"
	while read -r word0 word1 word2; do
		generate "$word0" "$word1" "$word2"
	done < list.txt
	
	unset IFS
}

main "$@"

