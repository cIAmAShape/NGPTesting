#!/bin/bash

echo "Line # | Line Length | Line Contents"
awk '{print NR, length, $0}' noise.txt | sort -k2 -nr | head -1

#Explanation of code:
#	
#	awk 'print NR, length, $0'  
#		prints every line of file noise.txt
#
#	sort -k2 -nr
#		sorts everything in reverse order (-nr) with respect to line size (-k2)
#
#	head -1
#		prints only the head (the top value, in this case the largest size)
#






#This is the power of pipes! Don't be afraid to use them!!
#Bonus not included, though...


