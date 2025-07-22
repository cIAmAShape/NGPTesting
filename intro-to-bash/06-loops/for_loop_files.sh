#!/bin/bash

for file in file*; do
	echo "${file} contents:"
	cat $file
	echo ""
done
