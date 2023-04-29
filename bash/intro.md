## Bash Aliases

Bash aliases are shortcuts that you can create to simplify commonly used commands in the terminal. Aliases can be defined in the `.bashrc` file, which is a shell script that gets executed when a new terminal session is started.

To create an alias, you use the `alias` command followed by the name of the alias and the command you want to execute when the alias is used. Here's an example:

```bash
alias ll='ls -alF'
```

This command creates an alias called ll that will execute the ls -alF command when it is used. The ls -alF command is a long listing of all files in the current directory, including hidden files (-a), in a list format (-l), and with file types indicated (-F).

You can create aliases for any command that you use frequently. Here are a few more examples:

```bash
alias gs='git status'
alias gp='git push'
alias gco='git checkout'
```

In this example, the aliases gs, gp, and gco are created for the git status, git push, and git checkout commands, respectively.

To make these aliases permanent, you need to add them to your .bashrc file. You can do this by opening the file in a text editor and adding the alias commands at the end of the file. For example:

```bash
nano ~/.bashrc

# Add the following lines at the end of the file
alias ll='ls -alF'
alias gs='git status'
alias gp='git push'
alias gco='git checkout'
```

After adding the aliases to the .bashrc file, you need to reload the file in the terminal for the changes to take effect. You can do this by either restarting the terminal or running the following command:

```bash
source ~/.bashrc
```

Now have a few useful bash aliases to simplify your terminal commands.

## Difference between Shell and Scripts

In Bash, the term "shell" refers to the command-line interface where you interact with the system by typing commands. A Bash script is a file containing a series of Bash commands that are executed in sequence.

Here are some differences between the two:

Interaction with the system: In the shell, you interact with the system by typing commands directly into the terminal. In contrast, a script is a saved file that contains a series of commands that can be executed in sequence.

Script reusability: You can reuse a script multiple times, whereas you cannot reuse shell commands. Once you exit the shell, the commands you entered are no longer available.

Example of shell command:

```bash
$ ls -alh
```
This command lists all files in the current directory with detailed information.

Example of a Bash script:
```bash
#!/bin/bash
echo "Welcome to my script!"
ls -alh
```

This script prints a message to the terminal and then lists all files in the current directory with detailed information. When you run this script, it will execute all the commands in the file in order.

When to use shells:
* Monitoring the system
* Data backup and restoring
* Creating an alert system
* User administration
* Security auditing

## Simple Script

To create a Bash script that creates a new directory, echos the completion to a new text file, and then displays the tree structure of the directory, you can follow the steps below:

1. Open a text editor such as nano or vim.
2. Type #!/bin/bash on the first line. This tells the shell that this is a Bash script.
3. Type echo "Enter directory name:" to prompt the user to enter a directory name.
4. Type read dirname to read the directory name entered by the user.
5. Type mkdir $dirname to create a new directory with the name entered by the user.
6. Type echo "Directory created successfully: $dirname" > completion.txt to echo the completion message to a new text file called completion.txt.
7. Type tree $dirname to display the tree structure of the newly created directory.
8. Save the file with a suitable name, such as create_dir.sh, and close the text editor.
9. Make the script executable by running chmod +x create_dir.sh.
10. Run the script by typing ./create_dir.sh in the terminal.

Here is the bash script:
```bash
#!/bin/bash

echo "Enter directory name:"
read dirname
mkdir $dirname
echo "Directory created successfully: $dirname" > completion.txt
tree $dirname
```

When the script is executed, it will prompt the user to enter a directory name. After the user enters a name and presses Enter, the script will create a new directory with that name in the current directory. It will then echo a completion message to a new text file called completion.txt and display the tree structure of the newly created directory.

To run the Bash script with necessary permissions, you need to make the script executable using the chmod command. Here's the process:

1. Open the terminal and navigate to the directory where the script is located using the cd command.
2. Type ls to confirm that the script is in the current directory.
3. Type chmod +x scriptname.sh to make the script executable. Replace scriptname.sh with the name of your Bash script.
4. Type ./scriptname.sh to run the script. Replace scriptname.sh with the name of your Bash script.

The chmod command changes the file permissions of the script, allowing you to execute it. The +x option adds the executable permission to the script.

## Bash Shebang

The bash shebang is a special line of code that starts with #! and is used to indicate to the operating system which interpreter should be used to execute the script. In the case of bash scripts, the shebang is #!/bin/bash.

Here's an example of a bash script with the shebang at the top:

```bash
#!/bin/bash

# This is a comment
echo "Hello World!"
```

When the script is executed, the operating system will use the bash interpreter to run the commands in the script. The shebang must be placed at the very beginning of the script, with no blank lines or whitespace before it.

## Comments in Bash

comments in bash are lines of text that are not executed as part of the script. They are used to add notes or explanations to the code, making it easier to understand and maintain.

In bash, there are two ways to add comments to your script:

1. Using the # character: The # character is used to indicate that the rest of the line is a comment. Any text following the # character on the same line will not be executed by the script.

Example:
```bash
# This is a comment in bash
echo "Hello World!" # This is also a comment
```

2. Using multi-line comments: You can also add multi-line comments in bash using the following syntax:
```bash
: '
This is a
multi-line
comment
'
```
In the example above, the : character is used to indicate that a command is being executed, followed by a single quote ('). The text is then written on multiple lines, and the comment is closed with another single quote (').

Example:
```bash
: '
This is a
multi-line
comment
'

echo "Hello World!"
```
Comments are an essential part of any script, and they can help you and other developers understand your code and make it easier to maintain.

## Running Scripts

Running scripts in bash is relatively straightforward. Here are the basic steps:

1. Create a new script file: You can create a new script file using any text editor, such as vi, nano, or even a graphical editor like gedit. Save the file with a .sh extension, which indicates that it's a shell script.

2. Add the necessary commands: In the script file, add the commands you want to run. Remember to include the shebang at the beginning of the file to tell the operating system which interpreter to use to run the script. You can also add comments to make the script more readable.

3. Set execute permissions: Before you can run the script, you need to give it execute permissions. You can do this using the chmod command. For example, to give the script owner execute permissions, you can run:

```bash
chmod u+x script.sh
```

4. Run the script: To run the script, simply type the name of the script file in the terminal and press Enter. For example:

```bash
./script.sh
```

If you're in the same directory as the script, you can use a relative path, like in the example above. If the script is located in a different directory, you'll need to use the full path to the script.

That's it! The commands in your script will be executed, and any output will be displayed in the terminal.