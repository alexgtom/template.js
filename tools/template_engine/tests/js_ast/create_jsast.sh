#!/bin/bash

# Generates ast files for all template files

for f in ../js_files/*.js
do
	basename=`basename $f .js`
	../../template_parse.py --jsast $f > $basename.jsast
done
