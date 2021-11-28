#!/usr/bin/env bash

# An example showing how to use the assert_array_equal function.

source ../src/testolini.sh

array_a=(1 2 3 4 5)
array_b=(1 2 3 4 5)
array_c=(2 1 5 3 4)

# Both assertions should pass.
assert_array_equal array_a array_b $LINENO
assert_array_not_equal array_a array_c $LINENO
