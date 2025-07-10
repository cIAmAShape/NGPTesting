#!/bin/bash

for file in $(ls -d haystack_*); do
	echo "Finding password for $file:"
	if ! grep "[pP][aA@][sS][sS][wW][oO0][rR][dD]" $file; then
		echo "Password for $file Not found."
	fi	
done
