#!/bin/dash

# testing usage errors

# only 1 arg
actual="$(seq 1 10 | python3 slippy 2>&1)"
expected="$(seq 1 10 | 2041 slippy 2>&1)"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

# flags, but no cmd
actual="$(seq 1 10 | python3 slippy -n -f 2>&1)"
expected="$(seq 1 10 | 2041 slippy -n -f 2>&1)"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

# invalid flag
actual="$(seq 1 10 | python3 slippy -Z '5q' 2>&1)"
expected="$(seq 1 10 | 2041 slippy -Z '5q' 2>&1)"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

# duplicate f flag
actual="$(seq 1 10 | python3 slippy -f -f '5q' 2>&1)"
expected="$(seq 1 10 | 2041 slippy -f -f '5q' 2>&1)"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

echo "Passed test"
exit 0