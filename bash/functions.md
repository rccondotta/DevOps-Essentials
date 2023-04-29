## Functions

a function is a reusable block of code that performs a specific task. Here are some examples of Bash functions:

1. Functions with no arguments

```bash
#!/bin/bash

# Function with no arguments
function print_hello {
  echo "Hello, world!"
}

# Call the function
print_hello
```
In this example, the print_hello function is defined to simply print "Hello, world!" to the console. The function is then called using print_hello.

2. Functions with arguments

```bash
#!/bin/bash

# Function with arguments
function greet {
  echo "Hello, $1!"
}

# Call the function with arguments
greet "Alice"
greet "Bob"
```
In this example, the greet function is defined to accept a single argument and use it to print a personalized greeting. The function is then called twice, passing in different arguments each time.

3. Variable scope in functions

```bash
#!/bin/bash

# Define a global variable
my_var="global"

# Function that sets a local variable
function set_local_var {
  local my_var="local"
  echo "Inside function: my_var is $my_var"
}

# Call the function
set_local_var

# Output the global variable
echo "Outside function: my_var is $my_var"
```

In this example, the set_local_var function sets a local variable called my_var to "local". The function then outputs the value of my_var inside the function. After the function is called, the global variable my_var is output, which still has a value of "global". This demonstrates that variables declared inside a function are local to that function and do not affect variables with the same name in the global scope.