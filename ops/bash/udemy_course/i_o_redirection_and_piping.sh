#!/bin/bash

#io

: '
python hello.py > file.txt #stdout to file (standard output)
python hello.py >> file.txt #stdout to file (but append not overwrite)
python hello.py 2> error.log #stderr to file
python hello.py 2>&1 #stderr to stdout
python hello.py 2> /dev/null #errors to garbage but it will be deleted
python hello.py &> /dev/null #errrors and output to garbage
diff <(ls -r) <(ls) #compare diff between 2 stdout without files
python hello.py < foot.txt #feeding the program
'

: << 'END_COMMENT'

this is a

multi line

comment

END_COMMENT

#piping
echo "babababababa" > baba.txt
echo "mama" >> baba.txt
echo "mama" >> baba.txt
echo "ttt" >> baba.txt
echo "rr" >> baba.txt
echo "hhh" >> baba.txt
echo "mama" >> baba.txt
echo "uuu" >> baba.txt
echo "mama" >> baba.txt
echo "pp" >> baba.txt
echo "mama" >> baba.txt
echo "iititi" >> baba.txt
cat baba.txt | tail -n 3 #show the last 3 lines of the file
cat baba.txt | tail -n 3 | xargs mkdir
cat baba.txt | tail -n 3 | xargs rmdir
rm baba.txt


