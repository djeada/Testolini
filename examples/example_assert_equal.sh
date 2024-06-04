#!/usr/bin/env bash

# An example showing how to use the assert_equal function.

# Ensure the test framework is sourced correctly. Adjust the path as needed.
source ../src/testolini.sh

factorial() {
    # Function to calculate the factorial of a number passed as an argument.
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
assert_not_equal $(factorial 5) 30 $LINENO
assert_equal $(factorial 4) 24 $LINENO

echo "All tests completed successfully."
