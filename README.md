# Testolini
A testing framework built purely in Bash. Its purpose is to make creating small unit tests for your Bash scripts as simple as possible.
The framework is composed of a single script that contains a set of assertion functions. The framework may be sourced in any Bash script. 

![Testolini](https://github.com/djeada/Testolini/blob/main/resources/Capture.PNG)

<h1>Requirements</h1>
The framework requires Bash 4.0 or higher.

<h1>Installation</h1>
Copy the src/testolini.sh script. You may put it directly in your project's directory or in your HOME directory. You may also want to modify the PATH variable to include the directory containing the script. Then it will be available in your Bash prompt.
 
<h1>Usage</h1>
Source the testolini.sh script in your Bash script.
You may now use the assertion functions when writing the tests. If the assertion fails, the framework will print the error message and exit the script. IF the assertion succeeds, the script will continue executing and no message will be printed.

Refer to examples directory for examples on how to use different assertion functions.

<h1>Project structure</h1>
The project is structured in the following way:

* src/testolini.sh: The library itself.
* src/test: The directory containing the unit tests for the library.
* examples: The directory containing example scripts which use the library.

<h1>Overview of functions</h1>

 * <code>assert_equal</code> - Asserts that two values are equal.
 * <code>assert_not_equal</code> - Asserts that two values are not equal.
 * <code>assert_true</code> - Asserts that a value is true.
 * <code>assert_false</code> - Asserts that a value is false.
 * <code>assert_variable_set</code> - Asserts that a variable is set.
 * <code>assert_variable_not_set</code> - Asserts that a variable is not set.
 * <code>assert_greater_than</code> - Asserts that a value is greater than a given value.
 * <code>assert_greater_than_equal</code> - Asserts that a value is greater than or equal to a given value.
 * <code>assert_less_than</code> - Asserts that a value is less than a given value.
 * <code>assert_less_than_equal</code> - Asserts that a value is less than or equal to a given value.
 * <code>assert_string_contains</code> - Asserts that a string contains a given string.
 * <code>assert_string_does_not_contain</code> - Asserts that a string does not contain a given string.
 * <code>assert_array_equal</code> - Asserts that two arrays are equal.
 * <code>assert_array_not_equal</code> - Asserts that two arrays are not equal.
 * <code>assert_array_contains</code> - Asserts that an array contains a given value.
 * <code>assert_array_does_not_contain</code> - Asserts that an array does not contain a given value.
 * <code>assert_identical_elements</code> - Asserts that two arrays consist of the same elements without regard to order.
 * <code>assert_elements_not_identical</code> - Asserts that two arrays do not consist of the same elements without regard to order.

<h1>Contributing</h1>
The framework is open source and can be found on <a href="https://github.com/djeada/Testolini">Github</a>. Feel free to fork and submit pull requests.

<h1>License</h1>
The framework is licensed under the <a href="https://github.com/djeada/Testolini/blob/master/LICENSE">MIT license</a>. 
