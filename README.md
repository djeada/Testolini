# Testolini
This repository contains a robust and versatile testing framework built entirely in Bash. Designed for simplicity and ease of use, this framework allows developers to write and execute test cases for their Bash scripts and other command-line utilities without the need for external dependencies.

![Testolini](https://github.com/djeada/Testolini/blob/main/resources/Capture.PNG)

## Features

- **Pure Bash Implementation:** Entirely written in Bash, making it highly portable and compatible with any Unix-like operating system.
- **Simple Test Syntax:** Easy-to-understand syntax for writing test cases, enabling quick adoption and minimal learning curve.
- **Assertions Library:** Comprehensive set of assertion functions to validate various conditions and outputs.
- **Test Suites:** Support for organizing tests into suites, facilitating structured and maintainable test cases.
- **Detailed Reporting:** Clear and concise test result reporting, including summaries of passed, failed, and skipped tests.
- **Extensible:** Flexible framework allowing for custom extensions and additional helper functions.
- **CI/CD Integration:** Easily integrable with continuous integration and continuous deployment pipelines to automate testing processes.
- **Lightweight:** Minimal overhead with no need for external dependencies or libraries.

## Prerequisites

- **Bash Shell:** Ensure you have Bash installed on your system. The framework is compatible with Bash version 4.0 and above.

## Usage

Follow these steps to use the framework:

1. **Clone the Repository:**
   ```sh
   git clone https://github.com/djeada/Testolini.git
   cd Testolini
   ```
   
2. **Include the Framework in Your Test Script**:
   Create a new test script and source the testing framework.
   
   ```sh
   #!/bin/bash
   source src/testolini.sh
   ```

3. **Write Test Cases**:
    Use the provided assertion functions to write your test cases.

    ```sh
    test_example() {
        assert_equal "expected_output" "$(your_command)"
        assert_true "[[ -f your_file ]]"
    }
    
    run_tests test_example
    ```

4. **Execute Your Test Script**:
   Run your test script to see the results.
   
   ```sh
   ./your_test_script.sh
   ```

### Overview of Functions

#### Assertions

| Function                     | Description                                                 | Usage                                     |
|------------------------------|-------------------------------------------------------------|-------------------------------------------|
| `assert_equal`               | Asserts that two values are equal.                          | `assert_equal expected actual`            |
| `assert_not_equal`           | Asserts that two values are not equal.                      | `assert_not_equal unexpected actual`      |
| `assert_greater_than`        | Asserts that a value is greater than a given value.         | `assert_greater_than limit value`         |
| `assert_greater_than_equal`  | Asserts that a value is greater than or equal to a given value. | `assert_greater_than_equal limit value`   |
| `assert_less_than`           | Asserts that a value is less than a given value.            | `assert_less_than limit value`            |
| `assert_less_than_equal`     | Asserts that a value is less than or equal to a given value.| `assert_less_than_equal limit value`      |
| `assert_true`                | Asserts that a value is true.                               | `assert_true condition`                   |
| `assert_false`               | Asserts that a value is false.                              | `assert_false condition`                  |
| `assert_variable_set`        | Asserts that a variable is set.                             | `assert_variable_set variable_name`       |
| `assert_variable_not_set`    | Asserts that a variable is not set.                         | `assert_variable_not_set variable_name`   |
| `assert_string_contains`     | Asserts that a string contains a given substring.           | `assert_string_contains substring string` |
| `assert_string_does_not_contain` | Asserts that a string does not contain a given substring. | `assert_string_does_not_contain substring string` |

#### Array Assertions

| Function                      | Description                                                            | Usage                                        |
|-------------------------------|------------------------------------------------------------------------|----------------------------------------------|
| `assert_array_equal`          | Asserts that two arrays are equal.                                     | `assert_array_equal expected_array actual_array` |
| `assert_array_not_equal`      | Asserts that two arrays are not equal.                                 | `assert_array_not_equal unexpected_array actual_array` |
| `assert_array_contains`       | Asserts that an array contains a given value.                          | `assert_array_contains value array`          |
| `assert_array_does_not_contain` | Asserts that an array does not contain a given value.                  | `assert_array_does_not_contain value array`  |
| `assert_identical_elements`   | Asserts that two arrays consist of the same elements without regard to order. | `assert_identical_elements expected_array actual_array` |
| `assert_elements_not_identical` | Asserts that two arrays do not consist of the same elements without regard to order. | `assert_elements_not_identical unexpected_array actual_array` |

## Contributing

Contributions are welcome! If you have improvements, additional features, or bug fixes to suggest, feel free to fork the repository, make your changes, and submit a pull request.

## License

This repository is licensed under the MIT License.
