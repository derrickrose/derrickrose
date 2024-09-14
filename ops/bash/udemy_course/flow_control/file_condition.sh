#!/bin/bash

# file condition
# test existing file
# [ -h file ] symlink (shortcut)
# [ -d file ] is directory
# [ -f file ] is a file
# [ -s file ] size is > 0
# [ file1 -nt file2 ] file 1 is more recent than file2
# [ file1 -ot file2 ] file 1 is older than file 2
# [ file1 -ef file2 ] file 1 and 2 are the same


if [ -e "./if_else.sh" ] && [ -r "if_else.sh" ] && [ -x "if_else.sh" ] && [ -w "./if_else.sh" ]
then echo "the file exists and readable and executable and writable"
fi

if [ -s "if_else.sh" ]
then echo "file is not empty"
else echo "file is empty"
fi

