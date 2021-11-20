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

assert() {
    # Asserts that condition passed in $1 is true.

    if [ -z "$2" ]; then
        return $E_PARAM_ERR
    fi

    local lineno=$2

    if [ ! $1 ]; then
        echo "Assertion failed:  \"$1\""
        echo "File \"$0\", line $lineno"
        exit $E_ASSERT_FAILED
    fi
}

assert_equal () {
    # Asserts that $1 and $2 are equal.

    local lineno=$3

    if [ $(check_integer "$1") -eq 1 ] && [ $(check_integer "$2") -eq 1 ]; then
        if [ "$1" -ne "$2" ]; then
            echo "Assertion failed:  \"$1\""
            echo "File \"$0\", line $lineno"
            exit $E_ASSERT_FAILED
        fi
    else
        if [[ "$1" != "$2" ]]; then
            echo "Assertion failed:  \"$1\""
            echo "File \"$0\", line $lineno"
            exit $E_ASSERT_FAILED
        fi
    fi
}

assert_not_equal () {
    # Asserts that $1 and $2 are not equal.

    local lineno=$3

    if [ $(check_integer "$1") -eq 1 ] && [ $(check_integer "$2") -eq 1 ]; then
        if [ "$1" -eq "$2" ]; then
            echo "Assertion failed:  \"$1\""
            echo "File \"$0\", line $lineno"
            exit $E_ASSERT_FAILED
        fi
    else
        if [[ "$1" == "$2" ]]; then
            echo "Assertion failed:  \"$1\""
            echo "File \"$0\", line $lineno"
            exit $E_ASSERT_FAILED
        fi
    fi
}

assert_true () {
    # Asserts that $1 is equal to string "true".

    local lineno=$2

    if [ "$1" != true ]; then
        echo "Assertion failed:  \"$1\""
        echo "File \"$0\", line $lineno"
        exit $E_ASSERT_FAILED
    fi
}

assert_false () {
    # Asserts that $1 is equal to string "false".

    local lineno=$2

    if [ "$1" != false ]; then
        echo "Assertion failed:  \"$1\""
        echo "File \"$0\", line $lineno"
        exit $E_ASSERT_FAILED
    fi
}

assert_variable_set () {
    # Asserts that $1 is set.

    local lineno=$2

    if [ -z "$1" ]; then
        echo "Assertion failed:  \"$1\""
        echo "File \"$0\", line $lineno"
        exit $E_ASSERT_FAILED
    fi
}

assert_variable_not_set () {
    # Asserts that $1 is not set.

    local lineno=$2

    if [ ! -z "$1" ]; then
        echo "Assertion failed:  \"$1\""
        echo "File \"$0\", line $lineno"
        exit $E_ASSERT_FAILED
    fi
}

assert_string_contains() {
    # Asserts that string $1 contains substring $2.

    local lineno=$3

    if [[ "$1" != *"$2"* ]]; then
        echo "Assertion failed:  \"$1\""
        echo "File \"$0\", line $lineno"
        exit $E_ASSERT_FAILED
    fi
}

assert_string_does_not_contain() {
    # Asserts that string $1 does not contain substring $2.

    local lineno=$3

    if [[ "$1" == *"$2"* ]]; then
        echo "Assertion failed:  \"$1\""
        echo "File \"$0\", line $lineno"
        exit $E_ASSERT_FAILED
    fi
}

assert_array_equal() {
    # Asserts that array $1 is equal to array $2.
    # All elements must be equal. Order matters.

    local -n array_a=$1
    local -n array_b=$2
    local lineno=$3

    #check length equal
    n=$(( ${#array_a[@]}))
    m=$(( ${#array_b[@]}))
    assert_equal $n $m $lineno

    #check element for element
    for (( i=0; i<n; i++ ))
    do
        assert_equal "${array_a[$i]}" "${array_b[$i]}" $lineno
    done

}

assert_array_not_equal() {
    # Asserts that array $1 is not equal to array $2.
    # A single element must be different. Order matters.
    local -n array_a=$1
    local -n array_b=$2
    local lineno=$3

    #check length equal
    n=$(( ${#array_a[@]}))
    m=$(( ${#array_b[@]}))

    if [ $n -ne $m ]; then
        return
    fi

    #check element for element
    for (( i=0; i<n; i++ ))
    do
        if [[ "${array_a[$i]}" != "${array_b[$i]}" ]]; then
            return
        fi
    done

    echo "Assertion failed:  \"$1\""
    echo "File \"$0\", line $lineno"
    exit $E_ASSERT_FAILED
}


assert_array_contains() {
    # Asserts that array $1 contains element $2.
    local -n array=$1
    local element="$2"
    local lineno=$3

    for (( i=0; i<${#array[@]}; i++ ))
    do
        if [ "${array[$i]}" = "$element" ]; then
            return
        fi
    done

    echo "Assertion failed:  \"$element\""
    echo "File \"$0\", line $lineno"
    exit $E_ASSERT_FAILED
}

assert_array_does_not_contain() {
    # Asserts that array $1 does not contain element $2.
    local -n array_a=$1
    local element="$2"
    local lineno=$3

    for (( i=0; i<${#array_a[@]}; i++ ))
    do
        if [ "${array_a[$i]}" = "$element" ]; then
            echo "Assertion failed:  \"$element\""
            echo "File \"$0\", line $lineno"
            exit $E_ASSERT_FAILED
        fi
    done

    return
}

assert_identical_elements() {
    # Asserts that array $1 contains the same elements as array $2.
    # Order of elements does not matter.
    local -n array_a=$1
    local -n array_b=$2
    local lineno=$3

    IFS=$'\n' array_a=($(sort <<<"${array_a[*]}")); unset IFS
    IFS=$'\n' array_b=($(sort <<<"${array_b[*]}")); unset IFS

    assertArrayEqual array_a array_b $lineno
}

assert_elements_not_identical() {
    # Asserts that array $1 does not contain the same elements as array $2.
    # Order of elements does not matter.
    local -n array_a=$1
    local -n array_b=$2
    local lineno=$3

    IFS=$'\n' array_a=($(sort <<<"${array_a[*]}")); unset IFS
    IFS=$'\n' array_b=($(sort <<<"${array_b[*]}")); unset IFS

    assert_not_equal array_a array_b $lineno
}
