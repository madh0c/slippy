#!/bin/dash

# testing input files

# simple
seq 1 2 > two.txt
seq 1 5 > five.txt
actual="$(python3 slippy '5d;5q' two.txt five.txt)"
expected="$(2041 slippy '5d;5q' two.txt five.txt)"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

# same file multiple times
actual="$(python3 slippy '5d;5q' two.txt five.txt two.txt two.txt)"
expected="$(2041 slippy '5d;5q' two.txt five.txt two.txt two.txt)"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

# $ finds EOF
actual="$(python3 slippy '$d' two.txt five.txt)"
expected="$(2041 slippy '$d' two.txt five.txt)"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

# files DNE
actual="$(python3 slippy '5d;5q' invalid1 invalid2 2>&1)"
expected="$(2041 slippy '5d;5q' invalid1 invalid2 2>&1)"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

echo "Passed test"
exit 0