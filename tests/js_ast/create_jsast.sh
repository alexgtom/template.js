#!/bin/bash

# Generates ast files for all template files

for f in ../js_files/*.js
do
	echo $f
	basename=`basename $f .js`
	../../template.py --jsast $f > $basename.jsast
done
