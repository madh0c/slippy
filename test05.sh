#!/bin/dash

# testing multiple commands

# quit on currLine when currline is deleted 
actual="$(seq 1 10 | python3 slippy '5d;5q')"
expected="$(seq 1 10 | 2041 slippy '5d;5q')"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

# delete then print twice
actual="$(seq 1 10 | python3 slippy '5p;5p;5d')"
expected="$(seq 1 10 | 2041 slippy '5p;5p;5d')"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

# delete twice
actual="$(seq 1 10 | python3 slippy '5d;5d')"
expected="$(seq 1 10 | 2041 slippy '5d;5d')"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

# substitute, then sub again but reverse
actual="$(seq 1 10 | python3 slippy '5s/1/2/;5s/2/1/')"
expected="$(seq 1 10 | 2041 slippy '5s/1/2/;5s/2/1/')"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

# $ in second command
actual="$(seq 1 10 | python3 slippy '5p;$d')"
expected="$(seq 1 10 | 2041 slippy '5p;$d')"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

echo "Passed test"
exit 0