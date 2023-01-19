#!/bin/dash

# testing -f flag

# basic
echo 5d > commands.slippy
echo 5q >> commands.slippy
actual="$(seq 1 10 | python3 slippy -f commands.slippy)"
expected="$(seq 1 10 | 2041 slippy -f commands.slippy)"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

# if file DNE
actual="$(seq 1 10 | python3 slippy -f invalid.file 2>&1)"
expected="$(seq 1 10 | 2041 slippy -f invalid.file 2>&1)"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

# test multiple commands assorted with ; and \n
echo '5s/1/2/;5s/2/1/' > commands.slippy
echo '5p;/^1/p\n' >> commands.slippy
echo '$d' >> commands.slippy

actual="$(seq 1 10 | python3 slippy -f commands.slippy)"
expected="$(seq 1 10 | 2041 slippy -f commands.slippy)"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

echo "Passed test"
exit 0
