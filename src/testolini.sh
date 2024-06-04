E_ASSERT_FAILED=99
E_PARAM_ERR=98

check_integer() {
    # Check if $1 is an integer.
    if [[ "$1" =~ ^-?[0-9]+$ ]]; then
        echo 1
        return
    fi
    echo 0
}

check_float() {
    # Check if $1 is a floating point number.
    if [[ "$1" =~ ^-?[0-9]+\.[0-9]+$ ]]; then
        echo 1
        return
    fi
    echo 0
}

check_alphanumeric() {
    # Check if $1 is alphanumeric.
    if [[ "$1" =~ ^[a-zA-Z0-9]+$ ]]; then
        echo 1
        return
    fi
    echo 0
}

assert_equal() {
    # Asserts that $1 and $2 are equal.
    local lineno=$3
    if [[ "$1" != "$2" ]]; then
        echo "assert_equal() failed:"
        echo "Expected: $1"
        echo "Actual: $2"
        echo "File \"$0\", line $lineno"
        exit $E_ASSERT_FAILED
    fi
}

assert_not_equal() {
    # Asserts that $1 and $2 are not equal.
    local lineno=$3
    if [[ "$1" == "$2" ]]; then
        echo "assert_not_equal() failed:"
        echo "Expected: $1 != $2"
        echo "Actual: $1 == $2"
        echo "File \"$0\", line $lineno"
        exit $E_ASSERT_FAILED
    fi
}

assert_greater_than() {
    # Asserts that $1 is greater than $2.
    local lineno=$3
    if [[ "$1" -le "$2" ]]; then
        echo "assert_greater_than() failed:"
        echo "Expected: $1 > $2"
        echo "Actual: $1 <= $2"
        echo "File \"$0\", line $lineno"
        exit $E_ASSERT_FAILED
    fi
}

assert_greater_than_or_equal() {
    # Asserts that $1 is greater than or equal to $2.
    local lineno=$3
    if [[ "$1" -lt "$2" ]]; then
        echo "assert_greater_than_or_equal() failed:"
        echo "Expected: $1 >= $2"
        echo "Actual: $1 < $2"
        echo "File \"$0\", line $lineno"
        exit $E_ASSERT_FAILED
    fi
}

assert_less_than() {
    # Asserts that $1 is less than $2.
    local lineno=$3
    if [[ "$1" -ge "$2" ]]; then
        echo "assert_less_than() failed:"
        echo "Expected: $1 < $2"
        echo "Actual: $1 >= $2"
        echo "File \"$0\", line $lineno"
        exit $E_ASSERT_FAILED
    fi
}

assert_less_than_or_equal() {
    # Asserts that $1 is less than or equal to $2.
    local lineno=$3
    if [[ "$1" -gt "$2" ]]; then
        echo "assert_less_than_or_equal() failed:"
        echo "Expected: $1 <= $2"
        echo "Actual: $1 > $2"
        echo "File \"$0\", line $lineno"
        exit $E_ASSERT_FAILED
    fi
}

assert_true() {
    # Asserts that $1 is equal to string "true".
    local lineno=$2
    if [[ "$1" != true ]]; then
        echo "assert_true() failed:"
        echo "Expected: true"
        echo "Actual: $1"
        echo "File \"$0\", line $lineno"
        exit $E_ASSERT_FAILED
    fi
}

assert_false() {
    # Asserts that $1 is equal to string "false".
    local lineno=$2
    if [[ "$1" != false ]]; then
        echo "assert_false() failed:"
        echo "Expected: false"
        echo "Actual: $1"
        echo "File \"$0\", line $lineno"
        exit $E_ASSERT_FAILED
    fi
}

assert_variable_set() {
    # Asserts that $1 is set.
    local lineno=$2
    if [ -z "$1" ]; then
        echo "assert_variable_set() failed:"
        echo "File \"$0\", line $lineno"
        exit $E_ASSERT_FAILED
    fi
}

assert_variable_not_set() {
    # Asserts that $1 is not set.
    local lineno=$2
    if [ ! -z "$1" ]; then
        echo "assert_variable_not_set() failed:"
        echo "File \"$0\", line $lineno"
        exit $E_ASSERT_FAILED
    fi
}

assert_string_contains() {
    # Asserts that string $1 contains substring $2.
    local lineno=$3
    if [[ "$1" != *"$2"* ]]; then
        echo "assert_string_contains() failed:"
        echo "String: \"$1\" does not contain substring: \"$2\""
        echo "File \"$0\", line $lineno"
        exit $E_ASSERT_FAILED
    fi
}

assert_string_does_not_contain() {
    # Asserts that string $1 does not contain substring $2.
    local lineno=$3
    if [[ "$1" == *"$2"* ]]; then
        echo "assert_string_does_not_contain() failed:"
        echo "String: \"$1\" contains substring: \"$2\""
        echo "File \"$0\", line $lineno"
        exit $E_ASSERT_FAILED
    fi
}

assert_array_equal() {
    # Asserts that array $1 is equal to array $2.
    # All elements must be equal. Order matters.
    local -n _array_a_ref=$1
    local -n _array_b_ref=$2
    local lineno=$3

    local n=${#_array_a_ref[@]}
    local m=${#_array_b_ref[@]}
    if [ $n -ne $m ]; then
        echo "assert_array_equal() failed:"
        echo "The arrays are not of equal length."
        echo "Expected length: $n"
        echo "Actual length: $m"
        echo "File \"$0\", line $lineno"
        exit $E_ASSERT_FAILED
    fi

    for (( i=0; i<n; i++ )); do
        if [ "${_array_a_ref[$i]}" != "${_array_b_ref[$i]}" ]; then
            echo "assert_array_equal() failed:"
            echo "Expected: ${_array_a_ref[@]}"
            echo "Actual: ${_array_b_ref[@]}"
            echo "File \"$0\", line $lineno"
            exit $E_ASSERT_FAILED
        fi
    done
}

assert_array_not_equal() {
    # Asserts that array $1 is not equal to array $2.
    # A single element must be different. Order matters.
    local -n _array_a_ref=$1
    local -n _array_b_ref=$2
    local lineno=$3

    local n=${#_array_a_ref[@]}
    local m=${#_array_b_ref[@]}
    if [ $n -ne $m ]; then
        return
    fi

    for (( i=0; i<n; i++ )); do
        if [[ "${_array_a_ref[$i]}" != "${_array_b_ref[$i]}" ]]; then
            return
        fi
    done

    echo "assert_array_not_equal() failed:"
    echo "The arrays are equal."
    echo "Array: ${_array_a_ref[@]}"
    echo "File \"$0\", line $lineno"
    exit $E_ASSERT_FAILED
}

assert_array_contains() {
    # Asserts that array $1 contains element $2.
    local -n _array_ref=$1
    local element="$2"
    local lineno=$3

    for (( i=0; i<${#_array_ref[@]}; i++ )); do
        if [[ "${_array_ref[$i]}" == "$element" ]]; then
            return
        fi
    done

    echo "assert_array_contains() failed:"
    echo "Array does not contain the element!"
    echo "Array: ${_array_ref[*]}"
    echo "Element: $element"
    echo "File \"$0\", line $lineno"
    exit $E_ASSERT_FAILED
}

assert_array_does_not_contain() {
    # Asserts that array $1 does not contain element $2.
    local -n _array_ref=$1
    local element="$2"
    local lineno=$3

    for (( i=0; i<${#_array_ref[@]}; i++ )); do
        if [[ "${_array_ref[$i]}" == "$element" ]]; then
            echo "assert_array_does_not_contain() failed:"
            echo "Array contains the element!"
            echo "Array: ${_array_ref[*]}"
            echo "Element: $element"
            echo "File \"$0\", line $lineno"
            exit $E_ASSERT_FAILED
        fi
    done
}

assert_identical_elements() {
    # Asserts that array $1 contains the same elements as array $2.
    # Order of elements does not matter.
    local -n _array_a_ref=$1
    local -n _array_b_ref=$2
    local lineno=$3

    IFS=$'\n'
    _array_a_ref_sorted=($(sort <<<"${_array_a_ref[*]}"))
    _array_b_ref_sorted=($(sort <<<"${_array_b_ref[*]}"))
    unset IFS

    if [[ "${_array_a_ref_sorted[*]}" != "${_array_b_ref_sorted[*]}" ]]; then
        echo "assert_identical_elements() failed:"
        echo "The arrays are not identical."
        echo "Expected: ${_array_a_ref[*]}"
        echo "Actual: ${_array_b_ref[*]}"
        echo "File \"$0\", line $lineno"
        exit $E_ASSERT_FAILED
    fi
}

assert_elements_not_identical() {
    # Asserts that array $1 does not contain the same elements as array $2.
    # Order of elements does not matter.
    local -n _array_a_ref=$1
    local -n _array_b_ref=$2
    local lineno=$3

    IFS=$'\n'
    _array_a_ref_sorted=($(sort <<<"${_array_a_ref[*]}"))
    _array_b_ref_sorted=($(sort <<<"${_array_b_ref[*]}"))
    unset IFS

    if [[ "${_array_a_ref_sorted[*]}" == "${_array_b_ref_sorted[*]}" ]]; then
        echo "assert_elements_not_identical() failed:"
        echo "The arrays are identical."
        echo "Expected: ${_array_a_ref[*]}"
        echo "Actual: ${_array_b_ref[*]}"
        echo "File \"$0\", line $lineno"
        exit $E_ASSERT_FAILED
    fi
}
