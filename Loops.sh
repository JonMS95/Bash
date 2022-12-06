#!/bin/bash

# For loops are quite simple:
#
# for RANGE_OR_VALUES
# do
#     ACTIONS
# done

# In the example below, a list of numbers is specified.

for i in 1 3 6 8
do
    echo $i
done

echo

# A range or numbers can be iterated as well. To specify the range the syntax to write should follow
# the {START..END..STEP} pattern:

for i in {1..10..2}
do
    echo "Number: $i."
done

echo

# There's another method which involves using the "seq" command. However, it's not going to be covered
# in this short tutorial, as it's currently outdated.
# On the other hand, C-Style syntax could be provided as well, same as follows:
# for (( INIT; CONDITION; STEP ))
# Same as in C language, infinite for loops may be declared, although it's not going to be performed
# in this tutorial. Following the path, "break" and "continue" statements can be used same way as in C.

for (( c=0; c<10; c++ ))
do
    if [ $c == 5 ]
    then
        break
    else
        if [ $c == 2 ]
        then
            continue
        fi
    fi
    echo "c = $c."
done

echo

# Strings and files may be used as iterable variables as well.
# Note that, in Bash language, each space-character separated substring can be treated as an element
# within an string array.

myString="Hello John. How are you today?"
for i in $myString
do
    echo $i
done

echo

# By the way, the proper syntax to declare arrays in Bash is the one shown in the line below:

myArray=('This' 'is' 'an' 'array')

for i in ${myArray[@]}
do
    echo $i
done

echo

if [ ! -d Loops_tempDir ]
then
    mkdir Loops_tempDir
else
    rm -rf Loops_tempDir/*
fi

# Files could be created or removed within for loops as well.

for i in 1 2 3
do
    touch Loops_tempDir/file-$i
    echo "File $i." > Loops_tempDir/file-$i
    date >> Loops_tempDir/file-$i
    echo >> Loops_tempDir/file-$i
done

# Trivia fact: ll alias (commonly used in the command line) stand for: ls -alF

ls -alF

echo

cat Loops_tempDir/*

rm -rf Loops_tempDir

# While loops are also supported by the Bash language. The syntax is the same as in "for" loops
# but writing "while" keyword instead of "for". For example, the while loop below calculates a
# factorial of an specified number:

fact=1
num=6

while [ $num -gt 1 ]
do
  fact=$((fact * num))
  num=$((num - 1))
done

echo $fact; echo