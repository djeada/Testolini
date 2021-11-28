#!/usr/bin/env bash

# An example showing how to use the assert_array_contains function.

source ../src/testolini.sh

example_array=(1 2 3 4 5)

# Both assertions should pass.
assert_array_contains example_array 5 $LINENO
assert_array_does_not_contain example_array 6 $LINENO
