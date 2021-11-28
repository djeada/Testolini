#!/usr/bin/env bash

# An example showing how to use the assert_identical_elements function.

source ../src/testolini.sh

array_a=(1 2 3 4 5)
array_b=(1 2 3 4 5)
array_c=(2 1 5 3 4)
array_d=(1 1 2 3 4)

# All assertions should pass.
assert_identical_elements array_a array_b $LINENO
assert_identical_elements array_a array_c $LINENO
assert_elements_not_identical array_a array_d $LINENO