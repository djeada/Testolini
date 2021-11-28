#!/usr/bin/env bash

# An example showing how to use the assert_equal function.

source ../src/testolini.sh

facotrial() {
    # Function to calculate factorial of a number passed as an argument.
    local number=$1
    local result=1

    while [ $number -gt 0 ]; do
        result=$(($result * $number))
        number=$(($number - 1))
    done

    echo $result
}

# Test if the function works correctly.
# Both assertions should pass.
assert_not_equal $(facotrial 5) 30 $LINENO
assert_equal $(facotrial 4) 24 $LINENO
