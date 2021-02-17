#!/bin/bash

summary="$2"
body="$3"

phon=$(echo "$summary $body" | tr "[:upper:]" "[:lower:]" | sed -e 's/å/o/g' -e 's/ä/a/g' -e 's/ö/o/g' | sed -E 's/[^a-zA-Z0-9,.!?+=/*()@$#%^&[:space:]-]//g' | espeak-ng -x -w /dev/null | head -c 200)
IFS="
"
for i in $phon
do
	echo "[[$i]]" | espeak-ng -v mb-us3 -s 130
done
