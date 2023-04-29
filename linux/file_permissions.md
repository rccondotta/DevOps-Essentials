# File Permissions

## Understanding File Permissions

File permissions are used to control access to files and directories by users and groups. The three types of permissions that can be assigned to files and directories are read, write, and execute.

There are three types of users in Linux: the owner of the file or directory, the group that the file or directory belongs to, and other users who are not the owner or a member of the group. Each user type can be assigned different permissions.

The permissions are represented by a string of characters that appear when you list a file or directory using the ls -l command. Here's an example output of ls -l:

```bash
-rw-r--r-- 1 user group 4096 Mar 31 10:22 example.txt
```

The first character (-) represents the file type. In this case, it's a regular file. If it was a directory, it would be represented by a d.

The next three characters (rw-) represent the read, write, and execute permissions for the owner of the file. In this example, the owner has read and write permissions but does not have execute permissions.

The next three characters (r--) represent the read, write, and execute permissions for the group. In this example, the group has read-only permissions.

The final three characters (r--) represent the read, write, and execute permissions for all other users. In this example, all other users have read-only permissions.

Here are some important concepts to keep in mind when working with file permissions in Linux:

1. Numeric permissions: In addition to the string representation, permissions can also be represented using numbers. The read, write, and execute permissions are represented by the numbers 4, 2, and 1, respectively. You can add these numbers together to create the numeric representation of the permissions. For example, read and write permissions would be represented as 6 (4 + 2), and read, write, and execute permissions would be represented as 7 (4 + 2 + 1).

2. Changing permissions: You can change the permissions of a file or directory using the chmod command. For example, to give the owner read, write, and execute permissions, you would use the command chmod 700 filename.

3. Changing ownership: You can also change the ownership of a file or directory using the chown command. For example, to change the owner of a file to a user named jane, you would use the command chown jane filename.

4. Default permissions: Newly created files and directories inherit permissions from the parent directory. You can set default permissions for newly created files and directories using the umask command.

5. Special permissions: There are two special permissions that can be assigned to files and directories: setuid and setgid. These permissions allow a user to run a file with the permissions of the owner or group, respectively. To set these permissions, you would use the chmod u+s filename or chmod g+s directory commands.

Overall, file permissions are an important aspect of Linux security and understanding how to work with them is essential for any Linux user or administrator.

## Octal (Numeric) Notation of File Permissions

Octal notation is a way of representing file permissions in Linux using a three-digit number. Each digit represents the permissions for a different user type: owner, group, and others.

The octal digits represent a binary value where each bit corresponds to a specific permission. The read, write, and execute permissions are represented by the bits 4, 2, and 1, respectively. If a permission is granted, its bit is set to 1. If a permission is not granted, its bit is set to 0.

Here's how the three-digit number is calculated:

* The first digit represents the permissions for the owner.
* The second digit represents the permissions for the group.
* The third digit represents the permissions for others.

To calculate the octal value, you simply add up the values of the permissions that are granted for each user type. For example:

* Read and write permissions (4 + 2) for the owner, and no permissions for the group and others would be represented as 600.
* Read, write, and execute permissions (4 + 2 + 1) for the owner, and read-only permissions (4) for the group and others would be represented as 744.
* Read, write, and execute permissions (4 + 2 + 1) for the owner, read and execute permissions (4 + 1) for the group, and no permissions for others would be represented as 750.

In general, the octal notation is used when setting file permissions using the chmod command. For example, to set the permissions of a file to 600, you would use the command chmod 600 filename.

## Changing File Permissions

You can change file permissions in Linux using the chmod command. Here are some examples of how to use the chmod command to change file permissions:

To add execute permission for the owner of a file named script.sh, you would use the following command:

```bash
chmod +x script.sh
```

This command adds the execute permission (+x) for the owner of the file.

To remove write permission for the group of a file named data.txt, you would use the following command:
```bash
chmod g-w data.txt
```

This command removes the write permission (-w) for the group of the file.

To set the permissions of a file named config.ini to read and write for the owner and read-only for everyone else, you would use the following command:

```bash
chmod 644 config.ini
```

This command sets the permissions to 6 (read and write) for the owner, 4 (read-only) for the group and 4 (read-only) for others.

To recursively change the permissions of a directory and its contents to read and execute for everyone, you would use the following command:

```bash
chmod -R a+rx directory
```

This command adds the read and execute permissions for all users (-R) recursively to the directory and all its contents (a+rx).

To set the setuid permission on a binary file named program, you would use the following command:

```bash
chmod u+s program
```

This command sets the setuid permission (+s) for the owner of the file, allowing the file to be executed with the permissions of the owner.

It's important to be careful when changing file permissions, as changing the wrong permissions can have unintended consequences. Always double-check the permissions before and after making changes, and make sure you understand the impact of the changes you are making.

## Effect of Permissions on Directories

Permissions also have an effect on directories, in addition to files. The permissions of a directory determine what actions can be performed on the files and subdirectories within that directory.

Here are the different permissions and their effects on directories:

1. Read permission (r): Allows a user to list the files and subdirectories within the directory.

2. Write permission (w): Allows a user to create, delete, and rename files and subdirectories within the directory.

3. Execute permission (x): Allows a user to access files and subdirectories within the directory, and execute files within the directory.

4. Setuid permission (s): When set on a directory, this permission allows files created within the directory to inherit the group ownership of the directory.

5. Setgid permission (s): When set on a directory, this permission allows files and subdirectories created within the directory to inherit the group ownership of the directory.

6. Sticky bit permission (t): When set on a directory, this permission allows users to delete only their own files within the directory. This is often used on shared directories to prevent accidental deletion of other users' files.

The permissions on a directory are important for controlling access to the files and subdirectories within it. For example, if a user does not have execute permission on a directory, they will not be able to access the files and subdirectories within it, even if they have read permission on those files and directories.

When setting permissions on directories, it's important to consider the needs of the users who will be accessing the files and directories within the directory, and to set permissions accordingly.

## Combining Find and Chmod Commands Together

You can combine the find and chmod commands to change the permissions of multiple files or directories that meet certain criteria. Here are some examples of how to use the find and chmod commands together:

1. To change the permissions of all files in the current directory and its subdirectories to read-only for all users, you would use the following command:

```bash
find . -type f -exec chmod 444 {} \;
```
This command uses find to locate all files (-type f) in the current directory and its subdirectories, and then uses exec to execute the chmod command on each file, setting the permissions to 444 (read-only for all users).

2. To change the permissions of all directories in the current directory and its subdirectories to read, write, and execute for the owner and read and execute for everyone else, you would use the following command:

```bash
find . -type d -exec chmod 755 {} \;
```

This command uses find to locate all directories (-type d) in the current directory and its subdirectories, and then uses exec to execute the chmod command on each directory, setting the permissions to 755 (read, write, and execute for the owner, and read and execute for everyone else).

3. To change the permissions of all files with a specific file extension (e.g., .txt) in the current directory and its subdirectories to read and write for the owner and read-only for everyone else, you would use the following command:

```bash
find . -name "*.txt" -type f -exec chmod 644 {} \;
```

This command uses find to locate all files with the extension .txt (-name "*.txt") in the current directory and its subdirectories, and then uses exec to execute the chmod command on each file, setting the permissions to 644 (read and write for the owner, and read-only for everyone else).

Note that the find command is a powerful tool that can be used to locate files and directories based on a wide range of criteria, including file type, file name, and file size. When using find and chmod together, it's important to test the command on a small subset of files or directories first, to ensure that the permissions are set correctly before running the command on a larger set of files or directories.

## Changing File Ownership (chown, chgrp)

You can use the chown and chgrp commands to change the ownership and group ownership of a file or directory.

chown stands for "change owner" and allows you to change the owner of a file or directory. The basic syntax is:


```bash
chown [OPTIONS] NEW_OWNER FILE
```
Here, NEW_OWNER can be either a user name or a user ID (UID) and FILE is the file or directory whose ownership you want to change. Some commonly used options are:

* -R - changes ownership recursively, i.e., including all files and directories within the specified directory
* -v - displays the output of the command, showing which files have been changed

Here are some examples:

1. Change the owner of a file:

```bash
chown john file.txt
```
This changes the owner of file.txt to the user john.

2.  Change the owner of a directory and all its contents:

```bash
chown -R john /var/www/html
```

This changes the owner of the directory /var/www/html and all its contents to the user john.

3. Change the owner of a file using the user ID:

```bash
chown 1000 file.txt
```
This changes the owner of file.txt to the user with the UID 1000.

chgrp stands for "change group" and allows you to change the group ownership of a file or directory. The basic syntax is:

```bash
chgrp [OPTIONS] NEW_GROUP FILE
```
Here, NEW_GROUP can be either a group name or a group ID (GID) and FILE is the file or directory whose group ownership you want to change. Some commonly used options are:

* -R - changes group ownership recursively, i.e., including all files and directories within the specified directory
* -v - displays the output of the command, showing which files have been changed

Here are some examples:

1. Change the group of a file:

```bash
chgrp users file.txt
```
This changes the group of file.txt to the group users.

2. Change the group of a directory and all its contents:

```bash
chgrp -R www-data /var/www/html
```
This changes the group of the directory /var/www/html and all its contents to the group www-data.

3. Change the group of a file using the group ID:

```bash
chgrp 100 file.txt
```
This changes the group of file.txt to the group with the GID 100.

## Understanding SUID (Set User ID)

SUID, or Set User ID, is a special permission that can be set on an executable file in Linux that allows the program to run with the privileges of the file owner instead of the user who executed it. This can be useful for allowing non-root users to perform certain actions that require root privileges.

Examples of SUID programs in Linux include:

* /bin/su - The su command allows users to switch to another user account, typically the root user, by entering the root password. By setting the SUID bit on the su binary, non-root users can use the command to gain root privileges.

* /usr/bin/passwd - The passwd command is used to change a user's password. By setting the SUID bit on the passwd binary, non-root users can change their own password without needing root privileges.

* /usr/bin/sudo - The sudo command allows users to execute commands with root privileges, without needing to switch to the root user account. By setting the SUID bit on the sudo binary, non-root users can use the command to gain root privileges.

It is important to note that SUID programs can pose security risks, as they may allow unauthorized users to gain elevated privileges on the system. It is recommended to use SUID programs only when necessary and to carefully review the permissions and ownership of any SUID binaries on the system.

## Understanding SGID (Set Group ID)

SGID, or Set Group ID, is a special permission that can be set on a file or directory in Linux that allows the file or directory to inherit the group ownership of its parent directory instead of the user who created it. This can be useful for allowing multiple users to work collaboratively on files within a shared directory while ensuring that all files are owned by a common group.

Examples of SGID directories and files in Linux include:

* /usr/bin/write - The write command allows users to communicate with other users on the system by sending messages to their terminal. By setting the SGID bit on the /usr/bin/write binary, messages sent by users are owned by the group of the directory they are sent from, rather than the user who sent them.

* /var/spool/mail - This directory is used to store mail for local users on the system. By setting the SGID bit on the /var/spool/mail directory, all mail files created within the directory are owned by the group of the directory, allowing multiple users to access and manage their mail files.

* /usr/local/bin - This directory contains user-installed executables on the system. By setting the SGID bit on the /usr/local/bin directory, any files created within the directory are owned by the group of the directory, allowing multiple users to install and use executables.

It is important to note that SGID files and directories can pose security risks, as they may allow unauthorized users to access sensitive information or modify files. It is recommended to use SGID directories and files only when necessary and to carefully review the permissions and ownership of any SGID files or directories on the system.

## Understanding the Sticky Bit

The sticky bit is a special permission that can be set on a directory in Linux. When the sticky bit is set on a directory, it restricts the deletion of files within that directory to only the file owner, the directory owner, or the root user.

This can be useful for preventing accidental deletion of important files in shared directories, such as /tmp, which is a common directory used to store temporary files.

For example, if the sticky bit is set on the /tmp directory, any user can create files within the directory, but they can only delete the files they own. This helps prevent users from accidentally deleting important files or directories within /tmp.

In Linux, the sticky bit is represented by the letter "t" in the permissions string of a directory. For example, the permissions string for a directory with the sticky bit set would look like this: "drwxrwxrwt".

To set the sticky bit on a directory in Linux, you can use the following command:

```bash
chmod +t /path/to/directory
```
To remove the sticky bit from a directory, you can use the following command:

```bash
chmod -t /path/to/directory
```
It is important to note that the sticky bit only affects the deletion of files within a directory, and does not restrict other actions, such as renaming or moving files. Additionally, the sticky bit has no effect on files outside of the directory on which it is set.

## Umask

Umask is a command used to set the default permissions for newly created files and directories. The umask value represents the permissions that should be masked, or removed, from the default permissions of the file or directory.

The umask value is typically represented as a three-digit octal number, where each digit represents the permissions that should be masked for the owner, group, and others. For example, a umask value of 022 would mask write permissions for the group and others, resulting in default permissions of 644 for new files and 755 for new directories.

Here are some examples of umask values and their resulting default permissions:

* umask 002 - This would result in default permissions of 664 for new files and 775 for new directories. The owner has read, write, and execute permissions, the group has read and write permissions, and others have read permissions.

* umask 027 - This would result in default permissions of 640 for new files and 750 for new directories. The owner has read and write permissions, the group has read permissions, and others have no permissions.

* umask 077 - This would result in default permissions of 600 for new files and 700 for new directories. The owner has read and write permissions, and the group and others have no permissions.

To set a umask value in Linux, you can use the following command:

```bash
umask <octal value>
```
For example, to set a umask value of 022, you would use the following command:

```bash
umask 022
```
The umask value can also be set in the shell configuration files, such as ~/.bashrc or /etc/profile, to apply the value globally for all users.

## Understanding File Attributes (Isaatr, chattr)

File attributes are special settings that can be applied to a file or directory to control various aspects of their behavior, such as access permissions, modification times, and other properties. The most common commands used to manage file attributes are "isattr" and "chattr".

"isattr" is a command used to display the current file attributes of a file or directory. Here are some common file attributes that can be displayed using the "isattr" command:

1. Immutable (i) - Prevents the file from being modified, deleted, or renamed, even by the root user.

2. Append-only (a) - Allows data to be added to the file, but prevents existing data from being modified or deleted.

3. No dump (d) - Prevents the file from being backed up using the "dump" utility.

For example, to display the file attributes of a file called "example.txt", you can use the following command:

```bash
isattr example.txt
```

"chattr" is a command used to change the file attributes of a file or directory. Here are some common file attributes that can be set using the "chattr" command:

1. Immutable (i) - Set the file to be immutable and prevent it from being modified, deleted, or renamed, even by the root user. For example, to set the immutable attribute on a file called "example.txt", you can use the following command:

```bash
chattr +i example.txt
```

2. Append-only (a) - Set the file to be append-only and allow data to be added to the file, but prevent existing data from being modified or deleted. For example, to set the append-only attribute on a file called "example.txt", you can use the following command:

```bash
chattr +a example.txt
```

3. No dump (d) - Set the file to be not dumpable and prevent it from being backed up using the "dump" utility. For example, to set the no dump attribute on a file called "example.txt", you can use the following command:

```bash
chattr +d example.txt
```

It is important to note that changing file attributes can have significant effects on the behavior of a file or directory, and should be done with caution. In particular, the "immutable" attribute can make it difficult or impossible to make changes to a file, even as the root user, so it should only be used when necessary.
