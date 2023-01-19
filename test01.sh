#!/bin/dash

# testing q command

# address is line number
actual="$(seq 1 10 | python3 slippy '5q')"
expected="$(seq 1 10 | 2041 slippy '5q')"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

# address is regex
actual="$(seq 1 10 | python3 slippy '/../q')"
expected="$(seq 1 10 | 2041 slippy '/../q')"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

# infinite input
actual="$(yes | python3 slippy '5q')"
expected="$(yes | 2041 slippy '5q')"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

# invalid address
actual="$(seq 1 10 | python3 slippy '//q' 2>&1)"
expected="$(seq 1 10 | 2041 slippy '//q' 2>&1)"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

# address is 1 or none, should print 1 line
actual="$(seq 1 10 | python3 slippy '1q')"
expected="$(seq 1 10 | 2041 slippy '1q')"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

actual="$(seq 1 10 | python3 slippy 'q')"
expected="$(seq 1 10 | 2041 slippy 'q')"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

# $ doesn't do anything to input
actual="$(seq 1 10 | python3 slippy '$q')"
expected="$(seq 1 10 | 2041 slippy '$q')"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi


echo "Passed test"
exit 0