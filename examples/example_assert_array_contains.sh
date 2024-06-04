#!/usr/bin/env bash

# An example showing how to use the assertion functions from the test framework.

# Ensure the test framework is sourced correctly. Adjust the path as needed.
source ../src/testolini.sh

# Define an example array for testing purposes.
example_array=(1 2 3 4 5)

# Test cases to demonstrate the usage of assert_array_contains and assert_array_does_not_contain.

# This assertion should pass as the element 5 is present in the example_array.
assert_array_contains example_array 5 $LINENO

# This assertion should pass as the element 6 is not present in the example_array.
assert_array_does_not_contain example_array 6 $LINENO

echo "All tests completed successfully."
