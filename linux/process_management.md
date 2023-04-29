# Process Management


## Process and The Linux Security Model

Linux processes are instances of programs or commands that are running on a Linux system. Each process has its own unique process ID (PID) and is associated with a set of system resources, such as CPU time, memory, and file descriptors.

The Linux security model is based on the principle of least privilege, which means that each process and user should have access only to the resources that they need to perform their tasks. Linux uses a variety of security mechanisms to enforce this principle, including file permissions, access control lists (ACLs), and user and group permissions.

Linux also includes a number of security features that are designed to protect the system from malicious or unauthorized access. These features include:

* Mandatory Access Control (MAC) - This is a security model that enforces access controls based on a set of rules defined by a system administrator. MAC is commonly used in high-security environments, such as government and military installations.

* Linux Security Modules (LSM) - These are kernel-level security modules that allow administrators to add additional security policies to the Linux system. LSMs can be used to enforce additional access controls or to implement security policies specific to certain applications or users.

* SELinux - SELinux is a type of MAC that is included in many Linux distributions. SELinux uses a set of security policies to restrict access to system resources and prevent unauthorized access to sensitive data.

* AppArmor - AppArmor is a security module that provides mandatory access control for individual applications. AppArmor allows administrators to define specific security policies for each application, restricting its access to system resources.

Overall, the Linux security model is designed to provide a secure and reliable computing environment, with a range of built-in security features and the ability to customize security policies to meet specific needs.

## Listing Processes (ps, pstree)

There are several commands that can be used to list processes running on the system. Two common commands are "ps" and "pstree".

1. The "ps" command:

The "ps" command stands for "process status" and is used to display information about active processes on the system. Here are some common options that can be used with "ps":

* "ps aux": This will display a list of all processes running on the system, including their PID, parent PID, and other information.
* "ps aux | grep <process name>": This will display only the processes that match the specified name.
* "ps -ef": This is similar to "ps aux", but uses a different output format.

Here's an example of using the "ps" command:

```bash
$ ps aux
```
This will display a list of all processes running on the system.

2. The "pstree" command:

The "pstree" command is used to display a tree-like diagram of processes on the system, showing the relationship between parent and child processes. Here are some common options that can be used with "pstree":

* "pstree -p": This will display the process ID of each process.
* "pstree -u": This will display the user associated with each process.

Here's an example of using the "pstree" command:

```bash
$ pstree -p
```
This will display a tree-like diagram of processes on the system, showing the relationship between parent and child processes, along with their process IDs.

## Getting a Dynamic Real-Time View of the Running System (top, htop)

There are several commands that can be used to get a dynamic, real-time view of the running system, including "top" and "htop".

1. The "top" command:

The "top" command is used to display real-time information about the processes running on the system, including CPU usage, memory usage, and other system metrics. Here are some common options that can be used with "top":

* "top": This will display a real-time view of the processes running on the system, sorted by CPU usage by default.
* "top -u <username>": This will display only the processes associated with the specified user.
* "top -p <pid>": This will display information about the specified process.

Here's an example of using the "top" command:

```bash
$ top
```
This will display a real-time view of the processes running on the system, sorted by CPU usage by default.

2. The "htop" command:

The "htop" command is similar to "top", but provides a more user-friendly interface and additional features, such as color-coding and the ability to sort processes by different metrics. Here are some common options that can be used with "htop":

* "htop": This will display a real-time view of the processes running on the system, sorted by CPU usage by default.
* "htop -u <username>": This will display only the processes associated with the specified user.
* "htop -p <pid>": This will display information about the specified process.

Here's an example of using the "htop" command:

```bash
$ htop
```
This will display a real-time view of the processes running on the system, sorted by CPU usage by default, using a color-coded interface.

## Signals and Killing Processes (kill, pkill, killall, pidof)

There are several commands that can be used to send signals to processes, including "kill", "pkill", "killall", and "pidof".

1. The "kill" command:

The "kill" command is used to send signals to processes, allowing them to be terminated, stopped, or restarted. Here are some common options that can be used with "kill":

* "kill <pid>": This will send the default "TERM" signal to the process with the specified process ID (PID).
* "kill -<signal> <pid>": This will send the specified signal to the process with the specified PID. For example, * "kill -9 <pid>" will send the "KILL" signal, which immediately terminates the process.

Here's an example of using the "kill" command:


```bash
$ kill 1234
```
This will send the default "TERM" signal to the process with PID 1234.

2. The "pkill" command:

The "pkill" command is used to send signals to processes based on their name or other attributes, allowing them to be terminated, stopped, or restarted. Here are some common options that can be used with "pkill":

* "pkill <process name>": This will send the default "TERM" signal to all processes that match the specified name.
* "pkill -<signal> <process name>": This will send the specified signal to all processes that match the specified name.

Here's an example of using the "pkill" command:

```bash
$ pkill firefox
```
This will send the default "TERM" signal to all processes that have "firefox" in their name.

3. The "killall" command:

The "killall" command is similar to "pkill", but matches processes based on their name only. Here are some common options that can be used with "killall":

* "killall <process name>": This will send the default "TERM" signal to all processes that match the specified name.
* "killall -<signal> <process name>": This will send the specified signal to all processes that match the specified name.

Here's an example of using the "killall" command:

```bash
$ killall chrome
```
This will send the default "TERM" signal to all processes that have "chrome" in their name.

4. The "pidof" command:

The "pidof" command is used to find the process ID (PID) of a running process based on its name. Here are some common options that can be used with "pidof":

* "pidof <process name>": This will display the PID of the process with the specified name.
* "pidof -s <process name>": This will display the PID of the oldest process with the specified name.

Here's an example of using the "pidof" command:

```bash
$ pidof sshd
```
This will display the PID of the "sshd" process.

## Foreground and Background Processes

processes can be run in either the foreground or the background. Foreground processes are those that run in the current terminal window, and their output is displayed in real-time. Background processes, on the other hand, run independently of the terminal window and do not display output unless redirected to a file or other output stream. Here are some examples of how to run processes in the foreground and background:

1. Running a foreground process:

To run a process in the foreground, simply execute the command in the terminal window. For example, to run the "ls" command in the foreground, type the following:

```shell
$ ls
```
This will list the contents of the current directory in the terminal window.

2. Running a background process:

To run a process in the background, add an ampersand ("&") at the end of the command. For example, to run the "sleep" command in the background for 10 seconds, type the following:

```shell
$ sleep 10 &
```
This will start the "sleep" command in the background and immediately return control to the terminal window. After 10 seconds, the process will complete and exit.

3. Switching between foreground and background processes:

To switch a background process to the foreground, use the "fg" command followed by the job ID (which can be found using the "jobs" command). For example, to switch the previously started "sleep" command to the foreground, type the following:

```shell
$ fg %1
```
This will bring the "sleep" command to the foreground, and its output (if any) will be displayed in the terminal window.

4. Running a command as a background job:

To run a command as a background job from the outset, add "nohup" before the command, and "&" at the end. This way, the process will continue running even after you log out or close the terminal window. For example, to start a web server as a background job, type the following:

```shell
$ nohup python3 -m http.server 8000 &
```

This will start a Python web server on port 8000 and run it in the background as a job. The "nohup" command ensures that the process continues running even after the terminal window is closed, and the ampersand at the end sends the process to the background.

## Job Control (jobs, fg, bg)

Job control is a feature that allows you to manage multiple jobs (processes) running in the same shell session. Here are some examples of how to use job control commands:

1. View running jobs:
To view a list of jobs currently running in the shell session, use the "jobs" command. For example:

```shell
$ sleep 10 &
[1] 1234
$ python my_script.py &
[2] 5678
$ jobs
[1]-  Running                 sleep 10 &
[2]+  Running                 python my_script.py &
```
This will show a list of currently running jobs, their job ID, and their status.

2. Bring a job to the foreground:

To bring a job to the foreground, use the "fg" command followed by the job ID. For example:

```shell
$ sleep 10 &
[1] 1234
$ fg 1
```
This will bring the "sleep 10" job to the foreground, and its output (if any) will be displayed in the terminal window.

3. Send a job to the background:

To send a job to the background, use the "bg" command followed by the job ID. For example:

```shell
$ python my_script.py
^Z
[1]+  Stopped                 python my_script.py
$ bg 1
[1]+ python my_script.py &
```
This will send the "my_script.py" job to the background, and it will continue running without outputting to the terminal window.

4. Resume a stopped job:

To resume a stopped job, use the "bg" or "fg" command followed by the job ID. For example:

```shell
$ python my_script.py
^Z
[1]+  Stopped                 python my_script.py
$ bg 1
[1]+ python my_script.py &
```
This will resume the "my_script.py" job in the background, and it will continue running without outputting to the terminal window.

Note that you can also use the Ctrl+Z shortcut to suspend a job and return to the shell prompt. The job can then be resumed or sent to the background using the commands above.
