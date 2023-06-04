# Automating Linux Administrative Tasks with Ansible

## Ansible

### Introduction
Ansible is an open-source automation tool that helps you automate tasks such as configuration management, application deployment, and orchestration. It simplifies the process of managing and maintaining infrastructure by allowing you to automate repetitive tasks and focus on more important work. Ansible is written in Python and uses a simple syntax called YAML (YAML Ain't Markup Language) to define automation workflows.

### Prerequisites
To use Ansible, you'll need the following:

* A Linux machine or virtual machine running Ubuntu 18.04 or later.
* SSH access to the target machines you want to manage.
* Basic knowledge of Linux commands and concepts.
* Python 3 installed on your machine.

### Installing Ansible

You can install Ansible on your local machine or on a remote server. Here's how to install it on Ubuntu:

1. Update your package list:
    ```bash
    sudo apt update
    ```

2. Install Ansible:

    ```bash
    sudo apt install ansible
    ```
3. Verify the installation:

    ```bash
    ansible --version
    ```

### Getting Started with Ansible

Once you've installed Ansible, you can begin automating tasks. Here's a simple example of using Ansible to create a new user on a remote server:

1. Create a new file called create_user.yml:

    ```yml
    nano create_user.yml
    ```

2. Add the following code to the file:
    
    ```yml
    ---
    - hosts: server
    become: yes

    tasks:
    - name: Add new user
        user:
        name: john
        state: present
        shell: /bin/bash
    ```

3. Replace server with the hostname or IP address of your remote server.
4. Save and close the file.
5. Run the playbook:

    ```bash
    ansible-playbook create_user.yml
    ```
This playbook will create a new user named john on the remote server.

Ansible is a powerful automation tool that can help you simplify the management and maintenance of your infrastructure. With its simple syntax and easy-to-use playbooks, you can automate repetitive tasks and focus on more important work. By following the steps outlined in this tutorial, you can get started with Ansible and begin automating your Linux administrative tasks.

## Ansible Inventory File

The Ansible inventory file is a simple text file that contains a list of servers or network devices that Ansible will manage. The inventory file is used by Ansible to determine the target hosts for running the automation tasks. In this tutorial, we'll cover the basics of creating and using an inventory file with Ansible.

### Basic Syntax
The basic syntax of an inventory file is straightforward. Each line represents a host or group of hosts that Ansible will manage. The format is as follows:

```ini
[<group_name>]
<hostname_or_ip_address>
```

Here's an example inventory file:

```ini
[web_servers]
web1.example.com
web2.example.com

[db_servers]
db1.example.com
db2.example.com
```

In this example, we have two groups: web_servers and db_servers. Each group contains a list of hostnames or IP addresses.

### Hostnames vs IP Addresses

You can use either a hostname or IP address to identify a host in the inventory file. However, it's generally recommended to use hostnames instead of IP addresses. Using hostnames makes it easier to manage changes to IP addresses, and it's more human-readable.

### Grouping Hosts

You can group hosts in the inventory file using square brackets. Grouping hosts can be useful for applying tasks to specific sets of hosts. For example, you might have a group of web servers that require specific configuration settings. Here's an example of how to group hosts in the inventory file:

```ini
[web_servers]
web1.example.com
web2.example.com

[db_servers]
db1.example.com
db2.example.com

[app_servers:children]
web_servers
db_servers
```

In this example, we have two groups: web_servers and db_servers. We then create a third group called app_servers that contains the child groups web_servers and db_servers. This allows us to apply tasks to all of the servers in the app_servers group.

### Specifying Variables

You can also specify variables for hosts or groups in the inventory file. This can be useful for setting specific configuration options for each host or group. Here's an example of how to specify variables in the inventory file:

```ini
[web_servers]
web1.example.com ansible_ssh_user=ubuntu ansible_ssh_private_key_file=~/.ssh/mykey.pem
web2.example.com ansible_ssh_user=ubuntu ansible_ssh_private_key_file=~/.ssh/mykey.pem

[db_servers]
db1.example.com ansible_ssh_user=ubuntu ansible_ssh_private_key_file=~/.ssh/mykey.pem
db2.example.com ansible_ssh_user=ubuntu ansible_ssh_private_key_file=~/.ssh/mykey.pem
```

In this example, we've added two variables for each host: ansible_ssh_user and ansible_ssh_private_key_file. These variables specify the SSH username and private key file for each host.

The Ansible inventory file is a simple but powerful tool that allows you to manage a group of hosts. By grouping hosts and specifying variables in the inventory file, you can make it easier to manage and apply tasks to specific sets of hosts.

## Ansible Ad-Hoc Commands: The Shell Module

In Ansible, ad-hoc commands are a quick and easy way to run simple tasks on one or more servers without the need for a playbook. The shell module is one of the most commonly used modules for running commands on remote servers. In this tutorial, we'll cover the basics of using the shell module with ad-hoc commands.

### Basic Syntax

The basic syntax for running an ad-hoc command with the shell module is as follows:

```php
ansible <hosts> -m shell -a "<command>"
```
Here's an example of running a ls command on a remote server using the shell module:

```css
ansible webserver -m shell -a "ls /var/www/html"
```

In this example, we're running the ls command on the webserver host to list the contents of the /var/www/html directory.

### Using Variables

You can also use variables with the shell module. Here's an example:

```arduino
ansible webserver -m shell -a "echo {{ ansible_hostname }}"
```

In this example, we're using the ansible_hostname variable to print the hostname of the webserver host.

### Running Commands as a Different User

By default, Ansible runs commands as the current user. However, you can also run commands as a different user using the --become-user option. Here's an example:

```css
ansible webserver -m shell -a "sudo apt-get update" --become-user=root
```

In this example, we're running the apt-get update command as the root user on the webserver host.

### Using Shell Scripts

You can also use shell scripts with the shell module. Here's an example:

```css
ansible webserver -m shell -a "/path/to/script.sh"
```
In this example, we're running the script.sh shell script on the webserver host.


The shell module is a powerful tool for running commands on remote servers with Ansible ad-hoc commands. By using variables, running commands as a different user, and running shell scripts, you can perform a wide range of tasks quickly and easily.

## Ansible Ad-Hoc Commands: The Script Module

The script module is an Ansible module that allows you to execute scripts on remote servers using ad-hoc commands. It provides a way to execute more complex tasks than the shell module. In this tutorial, we'll cover the basics of using the script module with ad-hoc commands.

### Basic Syntax

The basic syntax for running an ad-hoc command with the script module is as follows:

```php
ansible <hosts> -m script -a "<script>"
```
Here's an example of running a script called update.sh on a remote server using the script module:

```css
ansible webserver -m script -a "/path/to/update.sh"
```
In this example, we're running the update.sh script on the webserver host.

### Passing Arguments

You can also pass arguments to the script using the args parameter. Here's an example:

```css
ansible webserver -m script -a "/path/to/script.sh" --args "arg1 arg2 arg3"
```

In this example, we're passing three arguments to the script.sh script.

### Running Commands as a Different User

You can also run scripts as a different user using the --become-user option. Here's an example:

```css
ansible webserver -m script -a "/path/to/script.sh" --become-user=root
```

In this example, we're running the script.sh script as the root user on the webserver host.

### Using Environment Variables

You can use environment variables in your scripts by setting them using the environment parameter. Here's an example:

```css
ansible webserver -m script -a "/path/to/script.sh" --environment="VAR=value"
```

In this example, we're setting the VAR environment variable to value.

The script module is a powerful tool for running scripts on remote servers with Ansible ad-hoc commands. By passing arguments, running scripts as a different user, and using environment variables, you can perform a wide range of tasks quickly and easily.

## Ansible Ad-Hoc Commands: The APT Module

The apt module is an Ansible module that allows you to manage packages on Ubuntu and Debian-based systems using ad-hoc commands. It provides a way to install, update, and remove packages. In this tutorial, we'll cover the basics of using the apt module with ad-hoc commands.

### Basic Syntax

The basic syntax for running an ad-hoc command with the apt module is as follows:

```php
ansible <hosts> -m apt -a "<action> <package_name>"
```

Here's an example of installing the nginx package on a remote server using the apt module:

```arduino
ansible webserver -m apt -a "name=nginx state=present"
```
In this example, we're using the name parameter to specify the package name and the state parameter to specify that we want to ensure the package is present.

### Updating Packages

You can also use the apt module to update packages. Here's an example:

```arduino
ansible webserver -m apt -a "upgrade=yes"
```

In this example, we're using the upgrade parameter to update all packages on the webserver host.

### Removing Packages

You can remove packages using the apt module by setting the state parameter to absent. Here's an example:

```arduino
ansible webserver -m apt -a "name=nginx state=absent"
```

In this example, we're removing the nginx package from the webserver host.

### Using Variables

You can use variables with the apt module. Here's an example:

```arduino
ansible webserver -m apt -a "name={{ package_name }} state=present"
```

In this example, we're using the package_name variable to install a package on the webserver host.

### Running Commands as a Different User

By default, Ansible runs commands as the current user. However, you can also run commands as a different user using the --become-user option. Here's an example:

```css
ansible webserver -m apt -a "name=nginx state=present" --become-user=root
```

In this example, we're installing the nginx package as the root user on the webserver host.

The apt module is a powerful tool for managing packages on Ubuntu and Debian-based systems with Ansible ad-hoc commands. By installing, updating, and removing packages, and using variables and running commands as a different user, you can perform a wide range of tasks quickly and easily.

## Ansible Ad-Hoc Commands: The Service Module

The service module is an Ansible module that allows you to manage services on remote servers using ad-hoc commands. It provides a way to start, stop, and restart services. In this tutorial, we'll cover the basics of using the service module with ad-hoc commands.

### Basic Syntax

The basic syntax for running an ad-hoc command with the service module is as follows:

```php
ansible <hosts> -m service -a "<action> <service_name>"
```

Here's an example of starting the nginx service on a remote server using the service module:

```css
ansible webserver -m service -a "name=nginx state=started"
```
In this example, we're using the name parameter to specify the service name and the state parameter to specify that we want to ensure the service is started.

### Stopping Services

You can also use the service module to stop services. Here's an example:

```css
ansible webserver -m service -a "name=nginx state=stopped"
```

In this example, we're stopping the nginx service on the webserver host.

### Restarting Services

You can restart services using the service module by setting the state parameter to restarted. Here's an example:

```css
ansible webserver -m service -a "name=nginx state=restarted"
```

In this example, we're restarting the nginx service on the webserver host.

### Checking Service Status

You can also check the status of a service using the service module by setting the state parameter to status. Here's an example:

```css
ansible webserver -m service -a "name=nginx state=status"
```

In this example, we're checking the status of the nginx service on the webserver host.

### Running Commands as a Different User

By default, Ansible runs commands as the current user. However, you can also run commands as a different user using the --become-user option. Here's an example:

```css
ansible webserver -m service -a "name=nginx state=started" --become-user=root
```

In this example, we're starting the nginx service as the root user on the webserver host.

## Ansible Ad-Hoc Commands: The User Module

The user module is an Ansible module that allows you to manage users on remote servers using ad-hoc commands. It provides a way to create, modify, and delete users. In this tutorial, we'll cover the basics of using the user module with ad-hoc commands.

### Basic Syntax

The basic syntax for running an ad-hoc command with the user module is as follows:

```php
ansible <hosts> -m user -a "<action> <arguments>"
```
Here's an example of creating a user on a remote server using the user module:

```perl
ansible webserver -m user -a "name=johndoe password=$6$0cERKG46$KjU8W4UHY/6EfxL6aKx6de8WmYXJvFjM6ohEDpE0YYW.5O5v5g5Kq3AmfVHcnz9.IFvV2PygZ3PqV7PwMyJLj. groups=sudo"
```

In this example, we're creating a user named johndoe, setting their password, adding them to the sudo group, and using the $6$ format to hash the password with SHA-512.

### Modifying Users

You can also use the user module to modify existing users. Here's an example of changing the shell for a user:

```sql
ansible webserver -m user -a "name=johndoe shell=/bin/bash"
```

In this example, we're changing the shell for the johndoe user to /bin/bash.

### Deleting Users

You can delete users using the user module as well. Here's an example:

```sql
ansible webserver -m user -a "name=johndoe state=absent"
```

In this example, we're deleting the johndoe user from the remote server.

### Running Commands as a Different User

Similar to the service module, you can also run commands as a different user using the --become-user option with the user module. Here's an example:

```perl
ansible webserver -m user -a "name=johndoe password=$6$0cERKG46$KjU8W4UHY/6EfxL6aKx6de8WmYXJvFjM6ohEDpE0YYW.5O5v5g5Kq3AmfVHcnz9.IFvV2PygZ3PqV7PwMyJLj. groups=sudo" --become-user=root
```

In this example, we're creating the johndoe user as the root user on the webserver host.

The user module is a powerful tool for managing users on remote servers with Ansible ad-hoc commands. By creating, modifying, or deleting users, you can quickly manage access to your servers.

