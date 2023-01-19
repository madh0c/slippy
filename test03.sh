#!/bin/dash

# testing p command

# address is line number
actual="$(seq 1 10 | python3 slippy '5p')"
expected="$(seq 1 10 | 2041 slippy '5p')"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

# address is regex
actual="$(seq 1 10 | python3 slippy '/../p')"
expected="$(seq 1 10 | 2041 slippy '/../p')"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

# -n flag
actual="$(seq 1 10 | python3 slippy -n '5p')"
expected="$(seq 1 10 | 2041 slippy -n '5p')"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

# invalid address
actual="$(seq 1 10 | python3 slippy '//p' 2>&1)"
expected="$(seq 1 10 | 2041 slippy '//p' 2>&1)"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

# address is none
actual="$(seq 1 10 | python3 slippy 'p')"
expected="$(seq 1 10 | 2041 slippy 'p')"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

# $ 
actual="$(seq 1 10 | python3 slippy '$p')"
expected="$(seq 1 10 | 2041 slippy '$p')"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

echo "Passed test"
exit 0