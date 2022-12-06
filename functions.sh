#!/bin/bash

# The syntax for functions in bash is quite simple: just type the name, a parentheses, and the body
# of the function in the space within curly braces.

HelloWorld()
{
    echo "Hello World!"
}

# Calling the function is just as easy as typing its name:
HelloWorld; echo

# Variables are defined as global by default, even if they are declared within the function's body.

var1="A"
var2="B"

ChangeGlobalVars()
{
    var1="C"
    var2="D"
}

echo "Before calling ChangeGlobalVars(): var1 = $var1, var2 = $var2"

ChangeGlobalVars
echo "After calling ChangeGlobalVars(): var1 = $var1, var2 = $var2"
echo

# If the aim is to declare a variable as global, just type the "local" keyword before
# declaring the variable:

var3="E"

ChangeLocalVars()
{
    local var3="F"
    echo "var3 = $var3"
}

echo "Before calling ChangeLocalVars(): var3 = $var3"

# Note that expression evaluation is done by using $() in the line below.

echo "While calling ChangeLocalVars(): $(ChangeLocalVars)"
echo

# Bash functions do not return any desired value. Instead, they return 0 if the function
# succeed or a number in the 1-255 range if any error happened while executing it.
# The return value is assigned to the "?" variable.

ReturnSth()
{
    echo "Let's output a number."
    return 111
}

ReturnSth
echo "Returned value: $?"; echo

# If the goal is to return some arbitrarily defined value, it should be done by storing
# some value in a global variable defined within the function's body:

ReturnSthElse()
{
    arbVar="Return what we want."
}

ReturnSthElse
echo "arbVar = $arbVar"; echo

# As seen before, another suitable way to assign values to variables arbitrarily is to store the
# the result of the function's evaluation within a variable:

hello=$(echo HelloWorld)
echo $hello; echo

# In bash, parameters can be passed to functions. Note that the arguments are positional. Therefore,
# numbers are used to reference them ($1, $2, ..., $N). $0 is reserved for the script execution
# command (i.e., $0 == ./thisFile).

# $# is used to tell how many arguments have been passed to the function.

# The $* and $@ variables hold all positional parameters/arguments passed to the function.
# When double-quoted, "$*" expands to a single string separated by space (the first character of IFS) - "$1 $2 $n".
# When double-quoted, "$@" expands to separate strings - "$1" "$2" "$n".
# When not double-quoted, $* and $@ are the same.

StrangeMan()
{
    echo "Hello $1, $1 $2"
}

StrangeMan John Marston