# Networking

Network interfaces are hardware or software components that allow a computer to connect to a network. They can be physical, like Ethernet or Wi-Fi adapters, or virtual, like VPN tunnels or virtual LANs (VLANs).

Here are some examples of commonly used network interfaces and commands to configure and manage them in Linux:

1. Ethernet interface (e.g., eth0): This is a physical network interface that connects a computer to a network using an Ethernet cable. To view the configuration of an Ethernet interface, you can use the "ip" command with the "address" option, like this: "ip address show eth0".

2. Wi-Fi interface (e.g., wlan0): This is a wireless network interface that connects a computer to a Wi-Fi network. To view the configuration of a Wi-Fi interface, you can use the "iwconfig" command, like this: "iwconfig wlan0".

3. Loopback interface (e.g., lo): This is a virtual network interface that allows a computer to communicate with itself. It is commonly used for testing network services on the same machine. To view the configuration of the loopback interface, you can use the "ip" command with the "address" option, like this: "ip address show lo".

4. Bridge interface (e.g., br0): This is a virtual network interface that connects multiple physical or virtual interfaces together into a single network segment. It can be used to increase network performance or to implement network redundancy. To view the configuration of a bridge interface, you can use the "brctl" command, like this: "brctl show br0".

5. VPN interface (e.g., tun0): This is a virtual network interface that is created when a computer establishes a VPN connection. It allows the computer to communicate with other devices on the VPN network. To view the configuration of a VPN interface, you can use the "ip" command with the "address" option, like this: "ip address show tun0".

## Configuring the Network

1. ifconfig: This command is used to configure and view network interfaces in Linux. Here are some examples of how to use it:

    * To view the configuration of all network interfaces: "ifconfig -a"
    * To view the configuration of a specific interface (e.g., eth0): "ifconfig eth0"
    * To assign an IP address to an interface (e.g., eth0): "ifconfig eth0 192.168.0.2 netmask 255.255.255.0"
    * To bring an interface up or down (e.g., eth0): "ifconfig eth0 up" or "ifconfig eth0 down"

2. ip: This command is a more modern replacement for ifconfig and is used to view and configure network interfaces, IP addresses, and routing tables in Linux. Here are some examples of how to use it:

    * To view the configuration of all network interfaces: "ip address show"
    * To view the routing table: "ip route show"
    * To assign an IP address to an interface (e.g., eth0): "ip addr add 192.168.0.2/24 dev eth0"
    * To bring an interface up or down (e.g., eth0): "ip link set eth0 up" or "ip link set eth0 down"

3. route: This command is used to view and manage the routing table in Linux. Here are some examples of how to use it:

    * To view the routing table: "route -n"
    * To add a new static route: "route add -net 192.168.1.0 netmask 255.255.255.0 gw 192.168.0.1"
    * To delete a static route: "route del -net 192.168.1.0 netmask 255.255.255.0"
    * To change the default gateway: "route add default gw 192.168.0.1"

## Setting up Static IP on Ubuntu (netplan)

Netplan is the default network configuration utility in Ubuntu starting from version 17.10. Here are the steps to set up a static IP address using netplan:

1. Open the netplan configuration file using your favorite text editor. For example, run the following command in the terminal:

```shell
sudo nano /etc/netplan/00-installer-config.yaml
```
2. Modify the file to specify the network interface and the static IP address that you want to assign. Here is an example configuration:

```yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s3:
      dhcp4: no
      addresses: [192.168.1.100/24]
      gateway4: 192.168.1.1
      nameservers:
        addresses: [8.8.8.8, 8.8.4.4]
```

In this example, we are setting up a static IP address of 192.168.1.100 with a subnet mask of 255.255.255.0 (represented by the /24 suffix) for the network interface enp0s3. We are also specifying the default gateway and the DNS servers to use.

3. Save the changes and close the file.
4. Apply the new configuration using the following command:

```shell
sudo netplan apply
```

This will apply the new network configuration and activate the static IP address.

## Testing and Troubleshooting Network Connectivity

Testing and troubleshooting network connectivity can be done using various tools and techniques in Linux. Here are some examples of how to use them:

1. Ping: Ping is a basic tool used to test network connectivity. It sends an ICMP echo request to the target host and waits for a response. Here's how to use ping:

```bash
ping <hostname or IP address>
```
For example, to test connectivity to google.com:

```bash
ping google.com
```

If the ping is successful, you should see a series of responses indicating that the host is reachable. If the ping fails, it means that there is a problem with the network connection.

2. Traceroute: Traceroute is a tool used to trace the path that a packet takes from the local host to the target host. It does this by sending packets with increasing TTL values and observing the responses from each hop along the way. Here's how to use traceroute:

```bash
traceroute <hostname or IP address>
```

For example, to trace the path to google.com:

```bash
traceroute google.com
```

Traceroute will display a list of hops along the way and the time it took for each hop to respond. If there is a problem with the network connection, you may see delays or timeouts at a particular hop.

3. Netcat: Netcat is a versatile networking tool that can be used to test network connectivity. It can be used to send and receive data over TCP or UDP connections. Here's how to use netcat:

```bash
nc -vz <hostname or IP address> <port>
```
For example, to test if port 80 is open on google.com:

```bash
nc -vz google.com 80
```

Netcat will attempt to connect to the specified port on the target host and report whether the connection was successful or not.

4. Wireshark: Wireshark is a powerful network protocol analyzer that can be used to capture and analyze network traffic. It can be used to diagnose network problems such as connectivity issues, slow response times, and packet loss. Here's how to use Wireshark:

    * Install Wireshark using your package manager or download it from the Wireshark website.
    * Start Wireshark and select the network interface you want to capture traffic on.
    * Filter the captured packets to only show the traffic you are interested in.
    * Analyze the captured packets to identify any problems with the network connection.

## Using SSH

SSH (Secure Shell) is a secure protocol for remotely connecting to a Linux server or other networked device. Here are some examples of how to use SSH:

1. Connect to a remote host:

```bash
ssh username@hostname
```
For example, to connect to a server with the IP address 192.168.1.100 as the user "john":

```bash
ssh john@192.168.1.100
```
You will be prompted to enter the password for the user account on the remote host.

2. Connect using a specific port:

By default, SSH uses port 22 for connections. If the remote host is configured to use a different port, you can specify it using the -p option:

```bash
ssh -p <port> username@hostname
```
For example, to connect to a server with IP address 192.168.1.100 using port 2222 as the user "john":

```bash
ssh -p 2222 john@192.168.1.100
```
You will be prompted to enter the password for the user account on the remote host.

3. Copy files to or from a remote host:

To copy files to or from a remote host, you can use the scp (secure copy) command. The syntax is similar to the cp command:

```bash
scp <source> <destination>
```

For example, to copy a file called "file.txt" from the local machine to the home directory of the user "john" on the remote host:

```bash
scp file.txt john@192.168.1.100:~
```

To copy a file called "remote_file.txt" from the home directory of the user "john" on the remote host to the current directory on the local machine:

```bash
scp john@192.168.1.100:~/remote_file.txt .
```

You will be prompted to enter the password for the user account on the remote host.

4. Set up public key authentication:

    * Public key authentication provides a more secure and convenient way to connect to a remote host without having to enter a password every time. Here's how to set it up:

    *  Generate a public/private key pair on the local machine using the ssh-keygen command:

```bash
ssh-keygen -t rsa
```

    * Copy the public key to the remote host using the ssh-copy-id command:

```bash
ssh-copy-id username@hostname
```
You will be prompted to enter the password for the user account on the remote host.

    * Once the public key is copied to the remote host, you can connect to it without entering a password:

```bash
ssh username@hostname
```

The SSH client will automatically use the private key to authenticate the connection.

## Securing the OpenSSH Server

Securing the OpenSSH server (sshd) is an important aspect of ensuring the security of your system. Here are some examples of how to secure the OpenSSH server:

1. Disable root login:

By default, the root user can log in via SSH, but this is a security risk. It is recommended to disable root login and use a regular user account instead.

To disable root login, edit the SSH configuration file (/etc/ssh/sshd_config) and set the "PermitRootLogin" option to "no":

```bash
PermitRootLogin no
```

After making the change, restart the SSH server:

```bash
sudo systemctl restart sshd
```

2. Use key-based authentication:

Key-based authentication is more secure than password-based authentication because it eliminates the need to transmit passwords over the network. To use key-based authentication, follow these steps:

* Generate a public/private key pair on the client machine using the ssh-keygen command:

```bash
ssh-keygen -t rsa
```

* Copy the public key to the server:

```bash
ssh-copy-id username@hostname
```

* Edit the SSH configuration file (/etc/ssh/sshd_config) and set the following options:

```yaml
PubkeyAuthentication yes
PasswordAuthentication no
ChallengeResponseAuthentication no
```

* After making the changes, restart the SSH server:

```bash
sudo systemctl restart sshd
```

Now you can log in to the server using your private key:

```bash
ssh username@hostname -i /path/to/private/key
```

3. Change the default SSH port:

By default, SSH listens on port 22, but changing the port can make it harder for attackers to find and target your server. To change the port, edit the SSH configuration file (/etc/ssh/sshd_config) and set the "Port" option to a different port:

```yaml
Port 2222
```
After making the change, restart the SSH server:

```bash
sudo systemctl restart sshd
```
Note that you will need to specify the new port number when connecting to the server:

```bash
ssh username@hostname -p 2222
```

4. Enable two-factor authentication:

Two-factor authentication adds an extra layer of security by requiring both a password and a second factor such as a security token or a biometric factor. To enable two-factor authentication in OpenSSH, you can use the Google Authenticator PAM module:

* Install the Google Authenticator PAM module:

```bash
sudo apt-get install libpam-google-authenticator
```

* Edit the SSH configuration file (/etc/ssh/sshd_config) and set the following options:

```bash
ChallengeResponseAuthentication yes
UsePAM yes
Authentication
Methods publickey,keyboard-interactive
```
* Run the Google Authenticator setup for your user account:

```bash
google-authenticator
```
* After answering the prompts, edit the PAM configuration file (/etc/pam.d/sshd) and add the following line at the beginning of the file:

```bash
auth required pam_google_authenticator.so
```

* Restart the SSH server:

```bash
sudo systemctl restart sshd
```
Now when you log in via SSH, you will be prompted for both a password and a one-time code from the Google Authenticator app on your phone.

## Synchronizing Files and Directories using rsync

Rsync (Remote Sync) is a powerful command-line utility that can synchronize files and directories between local and remote systems. It is commonly used to backup and mirror files, or to transfer files between servers. Here are some examples of how to use rsync:

1. Synchronize files and directories on the same system:

To synchronize files and directories on the same system, use the following command:

bash
Copy code
rsync -av /path/to/source /path/to/destination
This will copy all files and directories from the source to the destination, preserving the file permissions, ownership, and timestamps.

* The "-a" option stands for "archive mode", which preserves the file attributes.
* The "-v" option stands for "verbose mode", which displays detailed information about the synchronization process.

2. Synchronize files and directories between two systems:

To synchronize files and directories between two systems, use the following command:

```bash
rsync -avz -e ssh user@source:/path/to/source user@destination:/path/to/destination
```

This will copy all files and directories from the source system to the destination system, using the SSH protocol for secure communication.

* The "-z" option enables compression, which reduces the amount of data transferred over the network.
* The "-e" option specifies the remote shell to use for the SSH connection.

Replace "user" with the username of the remote system.

3. Synchronize files and directories in dry-run mode:

To preview the synchronization process without actually copying any files, use the following command:

```bash
rsync -avn /path/to/source /path/to/destination
```

This will display a list of files and directories that would be copied if the synchronization was actually performed.

## Using wget

Wget (short for "web get") is a command-line utility for downloading files from the internet. It supports HTTP, HTTPS, and FTP protocols and can be used for downloading individual files or entire websites. Here are some examples of how to use wget:

1. Download a file from a URL:

To download a file from a URL, use the following command:

```bash
wget https://example.com/file.txt
```
This will download the file "file.txt" from the website "example.com" and save it in the current directory.

2. Download a file and save it with a different name:

To download a file and save it with a different name, use the "-O" option followed by the desired filename:

```bash
wget https://example.com/file.txt -O new_file.txt
```
This will download the file "file.txt" from the website "example.com" and save it as "new_file.txt" in the current directory.

3. Download a file using FTP:

To download a file using FTP, use the following command:

```bash
wget ftp://example.com/file.txt
```

This will download the file "file.txt" from the FTP server at "example.com" and save it in the current directory.

4. Download an entire website:

To download an entire website and all its contents, use the "-r" option for recursive downloading:

```bash
wget -r https://example.com/
```
This will download all files and directories from the website "example.com" and save them in a directory named after the website in the current directory.

5. Limit download speed:

To limit the download speed, use the "--limit-rate" option followed by the desired download rate in bytes per second:

```bash
wget --limit-rate=100k https://example.com/file.txt
```
This will limit the download speed of the file "file.txt" to 100 kilobytes per second.

6. Continue a partially downloaded file:

If a download is interrupted, wget can continue the download from where it left off using the "-c" option:

```bash
wget -c https://example.com/file.txt
```

This will continue downloading the file "file.txt" from where it left off, instead of starting from the beginning.

## Checking for Listening Ports (netstat, ss, lsof, telnet, nmap)

Checking for listening ports is an important part of network troubleshooting and security analysis. Here are some commands that can be used to check for listening ports on a system:

1. netstat:

The "netstat" command displays network connections, routing tables, and a list of listening ports. To display all listening ports, use the following command:

```bash
netstat -tuln
```
* The "-t" option shows only TCP connections.
* The "-u" option shows only UDP connections.
* The "-l" option shows only listening ports.
* The "-n" option displays port numbers instead of service names.

2. ss:

The "ss" command is similar to netstat but is more efficient and provides more information. To display all listening ports, use the following command:

```bash
ss -tuln
```
* The "-t" option shows only TCP connections.
* The "-u" option shows only UDP connections.
* The "-l" option shows only listening ports.
* The "-n" option displays port numbers instead of service names.

3. lsof:

The "lsof" command shows information about files opened by processes, including network connections and listening ports. To display all listening TCP ports, use the following command:

```bash
sudo lsof -iTCP -sTCP:LISTEN
```
* The "-iTCP" option shows only TCP connections.
* The "-sTCP:LISTEN" option shows only listening TCP ports.

4. telnet:

The "telnet" command can be used to test if a port is open and accepting connections. To connect to a listening port on a remote system, use the following command:

```bash
telnet remote_system_ip port_number
```
Replace "remote_system_ip" with the IP address of the remote system and "port_number" with the number of the port you want to test.

5. nmap:

The "nmap" command is a powerful network exploration and security auditing tool that can be used to scan for open ports on a system. To scan a system for open TCP ports, use the following command:

```bash
nmap -sT -O remote_system_ip
```
* The "-sT" option performs a TCP connect scan.
* The "-O" option attempts to identify the operating system of the remote system.
* Replace "remote_system_ip" with the IP address of the remote system you want to scan.

