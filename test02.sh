#!/bin/dash

# testing d command

# address is line number
actual="$(seq 1 10 | python3 slippy '5d')"
expected="$(seq 1 10 | 2041 slippy '5d')"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

# address is regex
actual="$(seq 1 10 | python3 slippy '/../d')"
expected="$(seq 1 10 | 2041 slippy '/../d')"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

# invalid address
actual="$(seq 1 10 | python3 slippy '//d' 2>&1)"
expected="$(seq 1 10 | 2041 slippy '//d' 2>&1)"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

# address is none, should delete everything
actual="$(seq 1 10 | python3 slippy 'd')"
expected="$(seq 1 10 | 2041 slippy 'd')"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

# last line
actual="$(seq 1 10 | python3 slippy '$d')"
expected="$(seq 1 10 | 2041 slippy '$d')"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

echo "Passed test"
exit 0