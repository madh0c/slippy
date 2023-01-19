#!/bin/dash

# testing whitespace and comments in commands

# simple
actual="$(seq 1 10 | python3 slippy '5s/1/2/; # 5s/2/1/')"
expected="$(seq 1 10 | 2041 slippy '5s/1/2/; # 5s/2/1/')"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

# assorted
echo '5s/1/2/;             5s/2/1/#g' > commands.slippy
echo '5p  ;  ### ; /^1/p\n' >> commands.slippy
echo '        $d' >> commands.slippy
actual="$(seq 1 10 | python3 slippy -f commands.slippy)"
expected="$(seq 1 10 | 2041 slippy -f commands.slippy)"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

# purely whitespace and comments
echo '             ' > commands.slippy
echo '### ; /^1/p\n' >> commands.slippy
actual="$(seq 1 10 | python3 slippy -f commands.slippy)"
expected="$(seq 1 10 | 2041 slippy -f commands.slippy)"
if [ "$expected" != "$actual" ]
then    
    echo "Failed test"
    exit 1
fi

echo "Passed test"
exit 0