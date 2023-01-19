#!/bin/dash

# testing commas
# (current implementation doesn't support commas so these will fail)

# number line addresses
actual="$(seq 1 10 | python3 slippy '3,5d')"
expected="$(seq 1 10 | 2041 slippy '3,5d')"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

# regex addresses
actual="$(seq 1 10 | python3 slippy '/4/,/6/d')"
expected="$(seq 1 10 | 2041 slippy '/4/,/6/d')"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

# number & regex addresses
actual="$(seq 1 10 | python3 slippy '3,/2/d')"
expected="$(seq 1 10 | 2041 slippy '3,/2/d')"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi


# assorted
actual="$(seq 1 102 | python3 slippy '2,/../p;/5/,/9/s/.//;/.2/,/.9/p;85q')"
expected="$(seq 1 102 | 2041 slippy '2,/../p;/5/,/9/s/.//;/.2/,/.9/p;85q')"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi


echo "Passed test"
exit 0