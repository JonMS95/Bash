#!/bin/bash

line_separator="*****************"
gen_msg="Generating the source file..."
compilation_msg="Compiling now..."
Run_msg="Running the program..."

echo "$line_separator"
echo "Input the text that is meant to be printed."
read message

echo "$line_separator"
echo "$gen_msg"
touch pastedCode.c
cat temp1.data > pastedCode.c
echo -e "\n\tconst char* inputStr = \"$message\";" >> pastedCode.c
cat temp2.data >> pastedCode.c

# Trivia fact: -e parameter enables echo command to make the proper interpretation of backslash characters.

echo "$line_separator"
echo "$compilation_msg"
gcc pastedCode.c -o pastedCode
rm pastedCode.c

echo "$line_separator"
echo "$Run_msg"
./pastedCode