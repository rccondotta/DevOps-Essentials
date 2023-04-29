## Program Flow

## if, elif, else and arithmetic comparison

Arithmetic Comparison:

```bash
#!/bin/bash

# Arithmetic comparison using if statement
a=10
b=20

if [ $a -eq $b ]
then
   echo "a is equal to b"
elif [ $a -gt $b ]
then
   echo "a is greater than b"
else
   echo "a is less than b"
fi
```

String Comparisons:
```bash
#!/bin/bash

# String comparison using if statement
str1="hello"
str2="world"

if [ "$str1" = "$str2" ]
then
   echo "Strings are equal"
elif [ "$str1" \< "$str2" ]
then
   echo "$str1 is less than $str2"
else
   echo "$str1 is greater than $str2"
fi
```

## Case Statements

Case statement is used to match the value of a variable against a list of patterns. Each pattern is followed by a list of commands to execute if the variable matches that pattern

```bash
#!/bin/bash

# Case statement example
echo "Enter a number between 1 and 3:"
read num

case $num in
   1)
      echo "You entered one."
      ;;
   2)
      echo "You entered two."
      ;;
   3)
      echo "You entered three."
      ;;
   *)
      echo "Invalid input. Please enter a number between 1 and 3."
      ;;
esac
```

## Menus

Menus are used to display a list of options to the user and allow them to select an option from the list.

```bash
#!/bin/bash

# Menu example
while true
do
  clear
  echo "Choose an option:"
  echo "1. Option 1"
  echo "2. Option 2"
  echo "3. Option 3"
  echo "4. Exit"

  read choice

  case $choice in
    1)
      echo "You selected Option 1"
      read -p "Press enter to continue"
      ;;
    2)
      echo "You selected Option 2"
      read -p "Press enter to continue"
      ;;
    3)
      echo "You selected Option 3"
      read -p "Press enter to continue"
      ;;
    4)
      echo "Exiting menu..."
      exit 0
      ;;
    *)
      echo "Invalid option. Please select again."
      read -p "Press enter to continue"
      ;;
  esac
done
```

this example, a while loop is used to display the menu continuously until the user chooses to exit. The clear command is used to clear the terminal screen before displaying the menu. The echo command is used to display the list of options to the user, and the read command is used to read the user's input.

The user's input is matched against the available options using a case statement. If the user enters 1, 2, or 3, the corresponding message is displayed, and the user is prompted to press enter to continue. If the user enters 4, the script exits using the exit command with an exit status of 0. If the user enters any other value, an error message is displayed, and the user is prompted to press enter to continue.

## Chaining Commands

Chaining commands refers to executing multiple commands in sequence on the same line, using special characters or operators to separate them.

Semicolons
```bash
command1 ; command2 ; command3
```
In this example, command1 is executed first, followed by command2, and then command3.

double ampersands (&&)

```bash
command1 && command2 && command3
```

In this example, command1 is executed first, and if it succeeds (i.e., returns an exit status of 0), command2 is executed next, and so on. If any of the commands fail, the remaining commands are not executed.

double vertical bars (||)

```bash
command1 || command2 || command3
```

In this example, command1 is executed first, and if it fails (i.e., returns a non-zero exit status), command2 is executed next, and so on. If any of the commands succeed, the remaining commands are not executed.

Here is an example of chaining commands in Bash using the double ampersand operator:

```bash
#!/bin/bash

# Chaining commands example
echo "Updating packages..."
sudo apt-get update && sudo apt-get upgrade -y && echo "Packages updated successfully."
```

In this example, the sudo apt-get update command is executed first, followed by the sudo apt-get upgrade -y command if the first command succeeds. Finally, the echo "Packages updated successfully." command is executed if both previous commands succeed.

Note that if any of the commands in the chain fails, the remaining commands are not executed. This can be useful for creating scripts with error handling and control flow based on the success or failure of each command.
