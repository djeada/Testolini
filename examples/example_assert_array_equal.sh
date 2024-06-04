#!/usr/bin/env bash

# An example showing how to use the assertion functions from the test framework.

# Ensure the test framework is sourced correctly. Adjust the path as needed.
source ../src/testolini.sh

# Define example arrays for testing purposes.
array_a=(1 2 3 4 5)
array_b=(1 2 3 4 5)
array_c=(2 1 5 3 4)

# Test cases to demonstrate the usage of assert_array_equal and assert_array_not_equal.

# This assertion should pass as array_a and array_b are identical.
assert_array_equal array_a array_b $LINENO

# This assertion should pass as array_a and array_c are not identical.
assert_array_not_equal array_a array_c $LINENO

echo "All tests completed successfully."
