# System Administration

## Task Automation and Scheduling using Cron

Cron is a time-based job scheduler in Unix-like operating systems. It enables users to schedule jobs (commands or scripts) to run automatically at specified times or intervals. The syntax of a cron job consists of five fields:

```scss
*     *     *     *     *
-     -     -     -     -
|     |     |     |     |
|     |     |     |     +----- day of the week (0 - 6) (Sunday is 0)
|     |     |     +------- month (1 - 12)
|     |     +--------- day of the month (1 - 31)
|     +----------- hour (0 - 23)
+------------- min (0 - 59)
```
Each field can be set to a specific value, a range of values, or a wildcard (*). Here are some examples of task automation and scheduling using cron:

Run a script every day at 3am:

```javascript
0 3 * * * /path/to/script.sh
```
Run a command every 30 minutes:

```javascript
*/30 * * * * /path/to/command
```

Run a script on the 1st and 15th of every month at midnight:

```javascript
0 0 1,15 * * /path/to/script.sh
```
Run a script every weekday at 8am:

```bash
0 8 * * 1-5 /path/to/script.sh
```
Run a script every hour from 9am to 5pm:

```javascript
0 9-17 * * * /path/to/script.sh
```

These are just a few examples of what you can do with cron. With its flexibility and power, cron can be used for a wide range of tasks, such as database backups, log rotation, and system maintenance.

## Scheduling Tasks Using Anacron

Anacron is a cron-like utility that is used to schedule periodic tasks on systems that are not always running. Unlike cron, which assumes that the system is always on and runs jobs at specific times, anacron runs jobs based on their age and frequency, so that they will be run the next time the system is turned on, even if the scheduled time has passed. Here are some basics of anacron with examples:

1. Configuration: Anacron is typically configured using a configuration file located at /etc/anacrontab. This file contains the details of the jobs to be run, including the delay between runs, the maximum delay, and the command to run. Here is an example configuration file:

```makefile
# /etc/anacrontab: configuration file for anacron

# The number of minutes between runs of the job
PERIOD=7

# The maximum delay between runs of the job
DELAY=1

# The job to run
7 1 job_name /path/to/command
```
This configuration file tells anacron to run the command /path/to/command every 7 days, with a maximum delay of 1 day.

2. Job scheduling: Anacron schedules jobs based on their age and frequency. When the system is turned on, anacron checks the age of each job and runs it if the delay between runs has passed. For example, if a job is scheduled to run every 7 days, and the system has been turned off for 14 days, anacron will run the job twice when the system is turned on again.

3. Logging: Anacron logs its activity to the system log file, typically /var/log/syslog on Debian-based systems. You can use tools like grep or awk to filter the log file for anacron entries.

4. Examples: Here are a few examples of how to use anacron:

Running a backup script every week:

```bash
7 1 backup /path/to/backup_script.sh
```
This job will run the backup script every 7 days, with a maximum delay of 1 day.

Running a log cleanup script every month:

```bash
Copy code
30 1 log_cleanup /path/to/log_cleanup_script.sh
```
This job will run the log cleanup script every 30 days, with a maximum delay of 1 day.

Running a system update script every day:

```bash
1 1 update /path/to/update_script.sh
```

This job will run the update script every day, with a maximum delay of 1 day.

## Mounting and Unmounting File Systems (df, mount, umount, fdisk, gparted)

In Linux, file systems can be mounted and unmounted using various commands such as df, mount, umount, fdisk, and gparted. Here are some examples of how to use these commands:

The df command is used to display the disk usage of all file systems. To use df, simply type df in the terminal. Here is an example:

```bash
$ df
Filesystem     1K-blocks    Used Available Use% Mounted on
/dev/sda1      239876124 3144924 223261348   2% /
tmpfs           82049796   87752  81962044   1% /dev/shm
```

The mount command is used to mount a file system. Here is an example of how to mount a USB drive:

```shell
$ sudo mount /dev/sdb1 /mnt/usb
```

In this example, /dev/sdb1 is the device file for the USB drive, and /mnt/usb is the mount point where the USB drive will be mounted.

The umount command is used to unmount a file system. Here is an example of how to unmount the USB drive that we mounted earlier:

```bash
$ sudo umount /mnt/usb
```

The fdisk command is used to manage disk partitions. Here is an example of how to create a new partition using fdisk:

```bash
$ sudo fdisk /dev/sda

Command (m for help): n
Partition type:
   p   primary (0 primary, 0 extended, 4 free)
   e   extended
Select (default p): p
Partition number (1-4, default 1):
First sector (2048-41943039, default 2048):
Last sector, +sectors or +size{K,M,G} (2048-41943039, default 41943039):

Command (m for help): w
```

In this example, we created a new primary partition on /dev/sda.

gparted is a graphical tool that can be used to manage disk partitions. Here is an example of how to use gparted to resize a partition:

```bash
$ sudo gparted
```
In the gparted window, select the partition you want to resize, and then click the "Resize/Move" button. Adjust the partition size as needed, and then click the "Apply" button to apply the changes.

## Working with Device Files (dd)

In Linux, dd (data duplicator) is a command-line utility used for low-level copying and conversion of data. dd can be used to work with device files, which are special files that represent hardware devices or virtual devices. Here are some examples of how to use dd with device files:

1. Creating a bootable USB drive:

    dd can be used to create a bootable USB drive from an ISO image file. Here is an example:

```bash
$ sudo dd if=/path/to/iso of=/dev/sdb bs=4M status=progress
```
In this example, /path/to/iso is the path to the ISO image file, and /dev/sdb is the device file for the USB drive. bs=4M sets the block size to 4 megabytes, which can improve performance. status=progress shows the progress of the operation.

2. Cloning a disk:

    dd can be used to clone a disk or a partition. Here is an example:

```bash
$ sudo dd if=/dev/sda of=/dev/sdb bs=4M status=progress
```

In this example, /dev/sda is the source disk or partition, and /dev/sdb is the target disk or partition. bs=4M sets the block size to 4 megabytes, which can improve performance. status=progress shows the progress of the operation.

3. Creating a disk image:

    dd can be used to create a disk image file from a disk or a partition. Here is an example:

```bash
$ sudo dd if=/dev/sda of=/path/to/image.img bs=4M status=progress
```

In this example, /dev/sda is the source disk or partition, and /path/to/image.img is the path to the output image file. bs=4M sets the block size to 4 megabytes, which can improve performance. status=progress shows the progress of the operation.

4. Writing a disk image:

    dd can be used to write a disk image file to a disk or a partition. Here is an example:

```bash
$ sudo dd if=/path/to/image.img of=/dev/sda bs=4M status=progress
```

In this example, /path/to/image.img is the path to the input image file, and /dev/sda is the target disk or partition. bs=4M sets the block size to 4 megabytes, which can improve performance. status=progress shows the progress of the operation.

These are just a few examples of how dd can be used to work with device files in Linux. dd can be a powerful tool, but it can also be dangerous if used improperly, as it can overwrite data without warning. Always double-check the source and target devices before running a dd command, and make sure to use the correct block size and other options as needed.

## Getting System Hardware Information (lwhw, liscpu, lsusb, lspci, dmidecode, hdparm)

In Linux, there are several commands that can be used to obtain system hardware information. Here are some examples:

1. lshw command:

    lshw (List Hardware) is a command-line tool that displays detailed information about the hardware installed on a system. Here is an example:

```bash
$ sudo lshw
```

    This command will display information about the CPU, memory, storage devices, network adapters, and other hardware components.

2. lscpu command:

    lscpu is a command-line utility that displays information about the CPU architecture and processor information. Here is an example:

```bash
$ lscpu
```
    This command will display information about the CPU architecture, number of cores, clock speed, cache size, and other details.

3. lsusb command:

    lsusb is a command-line utility that displays information about USB devices connected to the system. Here is an example:

```bash
$ lsusb
```
    This command will display a list of connected USB devices, along with their vendor and product IDs.

4. lspci command:

    lspci is a command-line utility that displays information about PCI devices connected to the system. Here is an example:

```bash
$ lspci
```

    This command will display a list of connected PCI devices, along with their vendor and device IDs.

5. dmidecode command:

    dmidecode is a command-line utility that displays information about the system's hardware configuration, including BIOS, motherboard, memory, and other components. Here is an example:

```bash
$ sudo dmidecode
```

    This command will display detailed information about the system's hardware configuration.

6. hdparm command:

    hdparm is a command-line utility that displays information about and configures hard disk drives. Here is an example:

```shell
$ sudo hdparm -I /dev/sda
```
    This command will display detailed information about the hard disk drive /dev/sda, including the disk model, firmware version, and features.

## Intro to systemmd



## Service Management (systemd and systemctl)

In Linux, systemd is the default init system used to manage services and daemons on the system. systemctl is the command-line tool used to interact with systemd. Here are some examples of how to use systemd and systemctl to manage services:

1. Starting a service:

    To start a service, use the start command with systemctl. For example, to start the Apache web server, use the following command:

```shell
$ sudo systemctl start apache2
```

    This command will start the Apache web server.

2. Stopping a service:

    To stop a service, use the stop command with systemctl. For example, to stop the Apache web server, use the following command:

```shell
$ sudo systemctl stop apache2
```

    This command will stop the Apache web server.

3. Restarting a service:

    To restart a service, use the restart command with systemctl. For example, to restart the Apache web server, use the following command:

```bash
$ sudo systemctl restart apache2
```

    This command will stop and then start the Apache web server.

4. Enabling a service:

    To enable a service to start automatically at boot time, use the enable command with systemctl. For example, to enable the Apache web server to start automatically at boot time, use the following command:

```shell
$ sudo systemctl enable apache2
```

    This command will enable the Apache web server to start automatically at boot time.

5. Disabling a service:

    To disable a service from starting automatically at boot time, use the disable command with systemctl. For example, to disable the Apache web server from starting automatically at boot time, use the following command:

```shell
$ sudo systemctl disable apache2
```

    This command will disable the Apache web server from starting automatically at boot time.

6. Checking the status of a service:

    To check the status of a service, use the status command with systemctl. For example, to check the status of the Apache web server, use the following command:

```bash
$ sudo systemctl status apache2
```

    This command will display the current status of the Apache web server.

