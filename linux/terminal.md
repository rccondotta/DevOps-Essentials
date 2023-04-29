# Linux Terminal in Depth


## Basic Command Structure

Basic structure of a Linux command is:

```css
command [options] [arguments]
```

Where:
command: is the name of the command that you want to execute
options: modify the behavior of the command, typically starting with a single hyphen - or a double hyphen --.
arguments: provide additional information to the command, typically separated by spaces.

Here's an example of a basic Linux command:

```bash
ls -la /home/username
```

In this example:
* ls is the command
* -la are the options
* /home/username is the argument

This command would list all files and directories in the /home/username directory, including hidden files, and display them in a long format.

Note that not all commands require options or arguments. Some commands may only require one or the other, while some may not require any at all.

## Getting Help, Man Pages (man, type, help, apropos)

Getting help is an important part of working with Linux, and there are several ways to access help and documentation for commands and utilities.

1. man: This command is used to display the manual pages for a command. The manual pages contain detailed information about the command, including its usage, options, and arguments. To use this command, simply type man followed by the name of the command you want to learn about. For example:

```bash
man ls
```

2. type: This command is used to display information about a command, including its type and location. To use this command, simply type type followed by the name of the command you want to learn about. For example:

```bash
type ls
```

3. help: This command is built into the Bash shell and is used to display information about built-in commands. To use this command, simply type help followed by the name of the command you want to learn about. For example:

```bash
help cd
```

4. apropos: This command is used to search for commands based on keywords. It searches the manual pages and displays a list of commands that match the keyword. To use this command, simply type apropos followed by the keyword you want to search for. For example:

```bash
apropos search
```

These commands can be very useful when you need more information about a command or are not sure how to use it. By learning how to use these commands, you can become more proficient at working with Linux and get more done in less time.

## Keyboard Shortcuts

Mastering the terminal in Linux can be greatly accelerated with the use of keyboard shortcuts. Here are some popular keyboard shortcuts to help you work more efficiently in the terminal:

1. Ctrl + C: This shortcut is used to cancel the currently running command or process.

2. Ctrl + Z: This shortcut is used to pause a running command or process and return to the terminal prompt. You can then use the fg command to resume the process in the foreground, or bg to resume it in the background.

3. Ctrl + D: This shortcut is used to log out of the current session or close the current terminal window.

4. Ctrl + L: This shortcut is used to clear the terminal screen and display a clean prompt.

5. Ctrl + A: This shortcut is used to move the cursor to the beginning of the current line.

6. Ctrl + E: This shortcut is used to move the cursor to the end of the current line.

7. Ctrl + U: This shortcut is used to delete all characters to the left of the cursor.

8. Ctrl + K: This shortcut is used to delete all characters to the right of the cursor.

9. Ctrl + R: This shortcut is used to search for previously typed commands in the command history.

10. Tab: This shortcut is used for command and file path completion, as mentioned in the previous question.

## The Bash History

The Bash history is a record of all the commands that have been entered into the Bash shell. Each time you enter a command, it is saved to the history, along with a timestamp and a sequence number.

The Bash history is stored in a file called .bash_history in the user's home directory. By default, the history file contains the last 500 commands that were entered, but this can be configured in the Bash shell settings.

The Bash history can be accessed and manipulated in a number of ways:

1. history command: This command is used to display the command history in the terminal. By default, it will display the last 500 commands, along with their sequence numbers.

2. !<number> command: This command is used to execute a specific command from the history, based on its sequence number. For example, if you want to execute the command that has sequence number 1234, you can type !1234 and press ENTER.

3. !! command: This command is used to execute the last command in the history. It is equivalent to typing !-1.

4. Ctrl + R: This shortcut is used to search for previously typed commands in the history, as mentioned in the previous question.

5. history -c: This command is used to clear the entire command history.

By using the Bash history, you can quickly access and repeat previously executed commands, which can save you time and effort when working in the terminal.

## Root vs. Non-Privileged Users (sudo, su, passwd)

The root user is a special administrative account that has full access to the system, including all files, directories, and applications. By contrast, non-privileged users are regular user accounts that have limited access to the system, based on their assigned permissions.

Here are some common commands used to manage root and non-privileged user accounts in Linux:

1. sudo: The sudo command allows non-privileged users to execute commands as the root user, with temporary elevated privileges. This can be useful for performing administrative tasks or running commands that require root access.

2. su: The su command allows a user to switch to the root user account, effectively becoming the root user until they exit the session. This command requires the root user's password to be entered.

3. passwd: The passwd command is used to change the password for a user account. When run as the root user, it can be used to change the password for any user account on the system.

Non-privileged users are created for everyday use and are granted limited permissions by default. This helps to prevent accidental or intentional damage to the system by limiting what the user can do. In contrast, the root user account has full access to the system and should only be used for administrative tasks that require elevated privileges.

It's generally recommended to avoid using the root account for everyday tasks and instead use the sudo command as needed to perform specific administrative tasks. This helps to minimize the risk of accidental damage to the system.