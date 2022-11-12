#!/bin/bash

# In bash, executing another file within a script is as easy as writing the command line.

YOUR_NAME="John"

./functions.sh | grep $YOUR_NAME > I_KNOW_YOU

cat I_KNOW_YOU
rm I_KNOW_YOU