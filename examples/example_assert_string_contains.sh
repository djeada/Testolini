#!/usr/bin/env bash

# Example script demonstrating the use of assert_string_contains and assert_string_does_not_contain functions.

# Ensure the test framework is sourced correctly. Adjust the path as needed.
source ../src/testolini.sh

# Define the main string for testing purposes.
main_string="This is a test string"

# Define the substring that should be present in the main string.
substring="test"

# Test case to assert that the main string contains the substring.
assert_string_contains "$main_string" "$substring" $LINENO

# Define the substring that should not be present in the main string.
non_substring="example"

# Test case to assert that the main string does not contain the non-substring.
assert_string_does_not_contain "$main_string" "$non_substring" $LINENO

echo "All tests completed successfully."
