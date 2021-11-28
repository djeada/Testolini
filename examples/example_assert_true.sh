#!/usr/bin/env bash

source ../src/testolini.sh


is_prime() {
    # Function that checks if a number is prime.
    local num=$1

    if [[ $num -eq 2 ]] || [[ $num -eq 3 ]]; then
        echo true
        return
    fi

    if [[ $(($num % 2)) -eq 0 ]] || [[ $(($num % 3)) -eq 0 ]]; then
        echo false
        return
    fi

    i=3

    while [[ $((i * i)) -le $num ]]; do

        if [[ $(($num % i)) -eq 0 ]]; then
            echo false
            return
        fi

        i=$((i + 2))
    done

    echo true
}

# Test if the function works correctly.
# Both assertions should pass.
assert_true $(is_prime 19) $LINENO
assert_false $(is_prime 25) $LINENO
