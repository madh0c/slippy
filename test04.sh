#!/bin/dash

# testing s command

# simple
actual="$(seq 1 10 | python3 slippy 's/1/2/')"
expected="$(seq 1 10 | 2041 slippy 's/1/2/')"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

# line number address
actual="$(seq 1 10 | python3 slippy '5s/1/2/')"
expected="$(seq 1 10 | 2041 slippy '5s/1/2/')"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

# regex address
actual="$(seq 1 10 | python3 slippy '/../s/1/2/')"
expected="$(seq 1 10 | 2041 slippy '/../s/1/2/')"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

# address AND g suffix
actual="$(seq 1 10 | python3 slippy '5s/1/2/g')"
expected="$(seq 1 10 | 2041 slippy '5s/1/2/g')"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

# $ address 
actual="$(seq 1 10 | python3 slippy '$s/1/2/')"
expected="$(seq 1 10 | 2041 slippy '$s/1/2/')"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

# non '/' delimiter
actual="$(seq 1 10 | python3 slippy '5s?1?2?g')"
expected="$(seq 1 10 | 2041 slippy '5s?1?2?g')"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

# no "searchPattern"
actual="$(seq 1 10 | python3 slippy 's//2/g' 2>&1)"
expected="$(seq 1 10 | 2041 slippy 's//2/g' 2>&1)"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

echo "Passed test"
exit 0