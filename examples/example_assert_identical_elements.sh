#!/usr/bin/env bash

# An example showing how to use the assert_identical_elements function.

# Ensure the test framework is sourced correctly. Adjust the path as needed.
source ../src/testolini.sh

# Define example arrays for testing purposes.
array_a=(1 2 3 4 5)
array_b=(1 2 3 4 5)
array_c=(2 1 5 3 4)
array_d=(1 1 2 3 4)

# Test cases to demonstrate the usage of assert_identical_elements and assert_elements_not_identical.

# This assertion should pass as array_a and array_b have identical elements in the same order.
assert_identical_elements array_a array_b $LINENO

# This assertion should pass as array_a and array_c have identical elements regardless of order.
assert_identical_elements array_a array_c $LINENO

# This assertion should pass as array_a and array_d do not have identical elements (array_d has a duplicate element).
assert_elements_not_identical array_a array_d $LINENO

echo "All tests completed successfully."
