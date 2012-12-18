#!/bin/bash

ABSPATH=$(cd "$(dirname "$0")"; pwd)

correct=()
error=()

count=0

for f in $ABSPATH/*.ast
do
	basename=`basename $f .ast`
	command="$ABSPATH/checkast.py $ABSPATH/$basename"
	output=`$command`
	rc=$?

	output_element=`echo -ne "${output}"`

	if [[ $rc != 0 ]]; then
		echo "*********************************************************************************************"
		echo "FAILED: $basename"
		echo "---------------------------------------------------------------------------------------------"
		echo "$output_element"

		# add errors to error array
		error=("${error[@]}" "$basename")
	else
		# add correct to correct array
		correct=("${correct[@]}" "$basename")
	fi

	# increment counter
	count=`expr $count + 1`
done

echo ""
echo "*********************************************************************************************"

# ***********************************************
# SUMMARY
# ***********************************************

# print out correct
echo "CORRECT:"
for c in "${correct[@]}"
do
	echo "    " "$c"
done

# print out error
echo "FAILED:"
for e in "${error[@]}"
do
	echo "    " "$e"
done

echo ""
echo ${#correct[@]} "out of" $count "passed"
echo "---------------------------------------------------------------------------------------------"
