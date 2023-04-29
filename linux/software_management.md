# Software Management

## DPKG (Debian and Ubuntu Based Distros)

DPKG (short for Debian Package) is a package manager used by Debian-based Linux distributions such as Debian, Ubuntu, Linux Mint, and others. It is used to manage the installation, configuration, and removal of software packages on a system.

DPKG is a low-level tool that works directly with the Debian package format (.deb) and handles package installation, removal, and upgrades. It can also be used to extract files from packages and to provide detailed information about installed packages.

Here are some examples of how to use DPKG:

1. Installing a package: To install a package with DPKG, use the following command:

```bash
sudo dpkg -i package_name.deb
```
Replace "package_name.deb" with the name of the package you want to install.

2. Removing a package: To remove a package with DPKG, use the following command:

```bash
sudo dpkg -r package_name
```
Replace "package_name" with the name of the package you want to remove.

3. Upgrading a package: To upgrade a package with DPKG, use the following command:

```bash
sudo dpkg -i package_name.deb
```
Replace "package_name.deb" with the name of the package you want to upgrade.

4. Listing installed packages: To list all the packages installed on your system, use the following command:

```bash
dpkg --list
```
This will give you a list of all installed packages along with their version numbers and other information.

5. Extracting files from a package: To extract files from a package, use the following command:

```bash
dpkg -x package_name.deb destination_directory
```
Replace "package_name.deb" with the name of the package you want to extract files from and "destination_directory" with the directory where you want the files to be extracted.

Overall, DPKG is a powerful tool for managing packages on Debian-based Linux systems, and it is commonly used by system administrators and developers to manage software installations and updates.

## APT (Advanced Package Tool)

APT (Advanced Package Tool) is a command-line tool used to manage software packages on Debian-based Linux distributions like Ubuntu, Linux Mint, and others. It works on top of the lower-level dpkg package management system and simplifies package installation and management by resolving package dependencies and automating the process.

Here are some examples of how to use APT:

1. Updating package lists: Before installing or updating packages, it's a good idea to update the package lists to make sure you have the latest versions available. To do this, run:

```bash
sudo apt update
```

2. Installing a package: To install a package, use the following command:

```bash
sudo apt install package_name
```
Replace "package_name" with the name of the package you want to install.

3. Removing a package: To remove a package, use the following command:

```bash
sudo apt remove package_name
```
Replace "package_name" with the name of the package you want to remove.

4. Upgrading packages: To upgrade all packages to their latest versions, run:

```bash
sudo apt upgrade
```
If you only want to upgrade a specific package, use:

```bash
sudo apt install --only-upgrade package_name
```

5. Searching for a package: To search for a package, use the following command:

```bash
apt search search_term
```

Replace "search_term" with the term you want to search for.

6. Listing installed packages: To list all the packages installed on your system, use the following command:

```bash
apt list --installed
```

This will give you a list of all installed packages along with their version numbers and other information.

Overall, APT is a powerful tool that simplifies package management on Debian-based Linux systems, and it is commonly used by system administrators and developers to manage software installations and updates.

## Compiling Programs from Source Code vs. Package Manager

### Compiling Programs from Source Code

Compiling programs from source code involves downloading the source code for a program and compiling it into an executable binary file that can be run on your system. This method offers more control over the configuration of the program, but can be more complex and time-consuming than using a package manager.

Examples of compiling programs from source code include:

* Installing Apache web server:

    * Download the source code from the Apache website.
    * Extract the source code to a directory.
    * Configure the build options.
    * Compile the source code using make.
    * Install the compiled binary using make install.

* Installing Node.js:

    * Download the source code from the Node.js website.
    * Extract the source code to a directory.
    * Configure the build options.
    * Compile the source code using make.
    * Install the compiled binary using make install.

### Using a Package Manager

Using a package manager involves using a pre-built binary package that has been compiled and packaged specifically for your distribution. This method is faster and more convenient than compiling from source, but may not offer as much flexibility in terms of configuration.

Examples of using a package manager include:

* Installing Apache web server:

    * On Ubuntu: sudo apt install apache2
    * On Fedora: sudo dnf install httpd

* Installing Node.js:

    * On Ubuntu: sudo apt install nodejs
    * On Fedora: sudo dnf install nodejs

Package managers like apt on Debian-based systems or dnf on Fedora-based systems manage dependencies and handle updates automatically.

Overall, both methods have their advantages and disadvantages depending on your needs and level of expertise. Compiling from source code provides more control and flexibility but requires more time and effort, while using a package manager is faster and easier but may be less customizable.

## Compiling C Programs

1. Install the prerequisites: gcc, g++, make
    * Ubuntu: sudo apt update && sudo apt install build-essentials
    * CentOS: sudo dnf group install "Development Tools"
2. Download the source files from the offical website\
3. Check the integrity of the tarball (has or digital signature)
4. Extract the archive and move into the resulting directory
5. Run: ./configure --help and set the required compilation options
6. Run: make
7. Run: make install

## Compiling Software From Source Code: ProFTPD

Compiling ProFTPD from source code in Ubuntu Linux involves several steps. Here's a general guide on how to do it:

1. Install the build dependencies:

```bash
sudo apt-get update
sudo apt-get install build-essential libssl-dev
```

2. Download the ProFTPD source code:

```bash
wget https://github.com/proftpd/proftpd/archive/v1.3.7a.tar.gz
```

3. Extract the downloaded archive:

```bash
tar -xvzf v1.3.7a.tar.gz
cd proftpd-1.3.7a
```

4. Configure the build options:

```bash
./configure --prefix=/usr/local/proftpd --sysconfdir=/etc/proftpd --with-modules=mod_sftp --enable-openssl --enable-openssl-verify --enable-dso --enable-ctrls
```
This command will configure the build options to install ProFTPD to /usr/local/proftpd, use /etc/proftpd as the configuration directory, enable the mod_sftp module, and enable OpenSSL for secure connections.

5. Build the software:

```bash
make
```
6. Install the software:

```bash
sudo make install
```
This command will install ProFTPD to the directory specified in the --prefix option.

7. Create the ProFTPD user and group:

```bash
sudo groupadd proftpd
sudo useradd -g proftpd -d /usr/local/proftpd -s /sbin/nologin proftpd
```

8. Set the appropriate permissions:

```bash
sudo chown -R proftpd:proftpd /usr/local/proftpd
```

9. Start the ProFTPD service:

```bash
sudo /usr/local/proftpd/sbin/proftpd
```

ProFTPD should now be running on your system.

Keep in mind that this is a general guide and the exact steps may vary depending on the version of ProFTPD you are compiling and the configuration options you choose. It's always a good idea to check the documentation that comes with the source code for specific instructions.
