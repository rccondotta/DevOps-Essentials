# Running Containerized Applications with Docker

## Running a Web Server in a Docker Container

The command:

```shell
docker container run -d -p 8080:80 --name mysite nginx
```

runs a Docker container with the following configurations:

* -d flag: Run the container in the background (detached mode).
* -p 8080:80 flag: Bind port 8080 on the host machine to port 80 on the container. This means that traffic directed to port 8080 on the host machine will be redirected to port 80 inside the container where the NGINX server is running.
* --name mysite flag: Assign a name to the container. In this case, the name is "mysite".
nginx: The name of the Docker image to use as a base for the container. In this case, the image is the official NGINX image from Docker Hub.

Overall, this command runs a new Docker container based on the NGINX image, exposes the NGINX server running inside the container to the host machine on port 8080, and gives the container the name "mysite".

```shell
docker container run -d -p 8081:80 --name mysite1 nginx
docker container run -d -p 8082:80 --name mysite2 httpd
docker container ls
```

The first command docker container ls lists all the running Docker containers. It will show you the status, name, ID, and other details of each container that is currently running on your system.

The second command docker container run -d -p 8081:80 --name mysite1 nginx creates a new Docker container based on the NGINX image, and starts it in detached mode (-d flag). It also maps port 8081 on the host machine to port 80 on the container (-p flag), and gives the container the name "mysite1".

The third command docker container run -d -p 8082:80 --name mysite2 httpd creates a new Docker container based on the Apache HTTP server image (httpd), and starts it in detached mode (-d flag). It also maps port 8082 on the host machine to port 80 on the container (-p flag), and gives the container the name "mysite2".

Overall, these commands create three Docker containers running NGINX, NGINX, and Apache HTTP server respectively. They are all running in detached mode and have been mapped to different host machine ports. The first container is named "mysite", the second is named "mysite1", and the third is named "mysite2". You can access the NGINX and Apache servers by navigating to http://localhost:8081 and http://localhost:8082 respectively in your web browser.

## Listing Images and Containers

To list Docker images, you can use the docker images command. Here is an example:

```shell
docker images
```

This will display a list of all the Docker images that are currently available on your system, including their repository, tag, image ID, and size.

To list Docker containers, you can use the docker ps command. Here is an example:

```shell
docker ps
```

This will display a list of all the Docker containers that are currently running on your system, including their container ID, image, command, status, and names.

If you want to list all Docker containers, including the ones that are not running, you can use the docker ps -a command. Here is an example:

```shell
docker ps -a
```

This will display a list of all the Docker containers that are available on your system, including the ones that are not currently running, along with their container ID, image, command, status, and names.

Note that if you want to filter the list of containers or images based on certain criteria, you can use additional options with these commands. For example, you can use the --filter option to filter containers or images based on their status, label, or other attributes. You can also use the --format option to customize the output format of the list. For more information on these options, you can refer to the Docker documentation or run the docker ps --help or docker images --help commands.

## Removing Images and Containers

To remove Docker images, you can use the docker rmi command followed by the ID or name of the image you want to remove. Here is an example:

```shell
docker rmi myimage:tag
```

This will remove the Docker image with the name "myimage" and the tag "tag" from your system.

If the image is currently in use by a container, you may need to stop and remove the container before you can remove the image. You can use the docker stop and docker rm commands to do this. Here is an example:

```shell
docker stop mycontainer
docker rm mycontainer
docker rmi myimage:tag
```

This will stop and remove the Docker container with the name "mycontainer", and then remove the Docker image with the name "myimage" and the tag "tag" from your system.

To remove Docker containers, you can use the docker rm command followed by the ID or name of the container you want to remove. Here is an example:

```shell
docker rm mycontainer
```

This will remove the Docker container with the name "mycontainer" from your system.

If the container is currently running, you may need to stop it before you can remove it. You can use the docker stop command to do this. Here is an example:

```shell
docker stop mycontainer
docker rm mycontainer
```

This will stop the Docker container with the name "mycontainer" and then remove it from your system.

Note that if you want to remove all unused images or containers from your system, you can use the docker image prune or docker container prune commands. These commands will remove any images or containers that are not currently in use by any running containers. Here is an example:

```shell
docker image prune
docker container prune
```

These commands will prompt you to confirm before removing any images or containers. If you want to bypass the prompt and remove all images or containers without confirmation, you can use the --force or -f option with these commands. For example:

```shell
docker image prune --force
docker container prune --force
```

These commands will remove all unused images or containers without prompting for confirmation.

## Shell Access to a Container

To get shell access to a running Docker container, you can use the docker exec command with the -it flags followed by the container name or ID and the shell command you want to run inside the container. Here is an example:

```bash
docker exec -it mycontainer sh
```

This will give you shell access to the Docker container with the name "mycontainer", and start a new shell session inside the container.

The -it flags are used to allocate an interactive TTY terminal to the container and attach it to your current shell session, allowing you to interact with the shell inside the container.

In the above example, we are using the sh command to start a new shell session inside the container. Depending on the operating system and base image used in the container, you may need to use a different shell command, such as bash or zsh.

Once you have shell access to the container, you can run any commands or scripts inside the container's file system, just as if you were running them on a regular Linux machine. You can navigate to different directories, edit files, run scripts, and so on.

To exit the shell session and return to your host machine's shell, you can type the exit command or press Ctrl-D. This will close the shell session and detach from the container, but the container will continue to run in the background.

## Executing Commands in a Running Container

To execute commands in a running Docker container, you can use the docker exec command followed by the container name or ID and the command you want to run inside the container. Here is an example:

```bash
docker exec mycontainer ls -l /app
```

This will execute the ls -l /app command inside the Docker container with the name "mycontainer", and display a list of files and directories in the /app directory of the container.

The docker exec command can be used to execute any command or script inside a running container, just as if you were running it on a regular Linux machine. You can specify multiple commands separated by a semicolon (;) or use shell commands such as && or || to execute multiple commands sequentially or conditionally.

You can also use the -it flags with the docker exec command to start an interactive shell session inside the container, as described in the previous answer.

Note that the commands you execute inside the container will be executed with the same user permissions and environment as the container itself, so you may need to use the sudo command or other privilege escalation mechanisms to execute certain commands or access certain files or directories.

## Getting Information about the Running Containers

To get information about the running Docker containers on your system, you can use the docker ps command. Here is an example:

```shell
docker ps
```

This will display a list of all running containers on your system, along with their container IDs, names, status, ports, and images.

If you want to see all containers on your system, including those that are not currently running, you can use the docker ps -a command. Here is an example:

```shell
docker ps -a
```

This will display a list of all containers on your system, whether they are running or stopped, along with their container IDs, names, status, ports, and images.

If you want to see additional information about a specific container, you can use the docker inspect command followed by the container name or ID. Here is an example:

```shell
docker inspect mycontainer
```

This will display detailed information about the Docker container with the name "mycontainer", including its configuration, network settings, storage volumes, and more.

You can also use the docker stats command to display real-time statistics about the CPU, memory, and network usage of the running containers on your system. Here is an example:

```shell
docker stats
```

This will display a continuously updating list of statistics for all running containers on your system. You can use the Ctrl-C command to stop the statistics display.

## Committing Container Changes into a New Image

After you have made changes to a running Docker container, you can commit those changes into a new Docker image using the docker commit command. Here is an example:

```shell
docker commit mycontainer mynewimage:tag
```

This will create a new Docker image with the tag "mynewimage:tag" based on the changes you made to the Docker container with the name "mycontainer".

The docker commit command takes two arguments: the name or ID of the container you want to commit changes from, and the name and tag you want to give to the new image. You can specify any valid image name and tag in the mynewimage:tag format, or omit the tag to use the "latest" tag by default.

Note that when you commit changes to a container, the resulting image will only include the changes you made to the container's file system, and will not include any changes you made to the container's environment variables, networking settings, or other configuration options.

After you have committed changes to a container, you can use the new image to create new containers with the same configuration and settings as the original container, but with the changes you made. You can push the new image to a Docker registry to make it available to others, or use it locally on your system.

## Tagging and Pushing Custom images to Docker Hub

To tag and push a custom Docker image to Docker Hub, you can follow these steps:

Tag your custom image with your Docker Hub repository name and a tag name of your choice using the docker tag command. Here is an example:

```shell
docker tag myimage:latest myusername/myrepo:mytag
```

This will tag the image "myimage:latest" with the name "myusername/myrepo:mytag", where "myusername" is your Docker Hub username and "myrepo" is the name of the repository you want to push the image to. You can choose any tag name you like.

Log in to your Docker Hub account using the docker login command. Here is an example:

```shell
docker login
```

This will prompt you to enter your Docker Hub username and password. If you have enabled two-factor authentication on your Docker Hub account, you will need to enter a one-time code as well.

Push the tagged image to Docker Hub using the docker push command. Here is an example:

```bash
docker push myusername/myrepo:mytag
```

This will push the tagged image "myusername/myrepo:mytag" to Docker Hub. You can now use this image to create new containers, or share it with others by giving them the name of the image and the repository you pushed it to.

Note that in order to push an image to Docker Hub, you need to have write access to the repository you are pushing to. If you have not created a repository on Docker Hub yet, you can do so by logging in to your Docker Hub account and clicking on the "Create Repository" button. You can also use other Docker registry services, such as Google Container Registry or Amazon Elastic Container Registry, by following similar steps.

## Image Structure and Layers

Docker images are made up of multiple layers, which are used to build up the file system of the container. Each layer represents a set of changes to the file system, such as adding or modifying files, and is stored as a separate entity within the image.

When you create a new image based on an existing image, Docker reuses as many layers as possible from the existing image, and only adds new layers for the changes you make. This allows Docker to minimize the amount of data that needs to be transferred when pulling or pushing images, and makes images more efficient and easier to manage.

Each layer in a Docker image is identified by a unique SHA256 hash, which is calculated based on the contents of the layer. This hash is used to determine if two layers are identical, and can be used to cache and reuse layers across multiple images.

The top layer of a Docker image is called the "container layer", and represents the current state of the file system of the container. When you create a new container based on an image, Docker creates a new container layer on top of the image layers, and uses it as the file system for the container.

Docker images are typically organized as a tree structure, with each layer pointing to its parent layer. This allows Docker to efficiently track the dependencies between layers, and to calculate the final state of the file system of a container by merging the changes from all layers in the image.

Understanding the structure and layers of Docker images can be useful for optimizing image size and performance, as well as for troubleshooting issues with image builds and deployments. You can use tools like docker history and docker inspect to inspect the layers and metadata of Docker images, and to analyze their dependencies and contents.

## Creating Custom Images using Dockerfile

To create a custom Docker image using a Dockerfile, you can follow these steps:

1. Create a new directory for your Dockerfile and any other files you want to include in the image.

2. Create a new file called "Dockerfile" in the directory, and open it in a text editor.

3. Write the instructions for building the image in the Dockerfile, using the Dockerfile syntax. Here is an example:

```bash
# Use an existing base image
FROM ubuntu:latest

# Update packages and install dependencies
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

# Copy the application code to the image
COPY app /app

# Set the working directory for the application
WORKDIR /app

# Install Python dependencies
RUN pip3 install -r requirements.txt

# Expose the port used by the application
EXPOSE 8000

# Define the command to run the application
CMD ["python3", "app.py"]
```

This Dockerfile starts with an Ubuntu base image, updates the packages, installs Python and pip, copies the "app" directory to the image, sets the working directory to "/app", installs the Python dependencies listed in "requirements.txt", exposes port 8000 for the application, and defines the command to run the application.

4. Save the Dockerfile and any other files in the directory.

5. Build the Docker image using the docker build command, specifying the path to the directory containing the Dockerfile. Here is an example:

```bash
docker build -t myimage:latest .
```

This will build a new Docker image called "myimage" with the tag "latest" based on the Dockerfile in the current directory.

6. Verify that the image was created successfully using the docker images command. Here is an example:

```bash
docker images
```

This will show a list of all Docker images on your system, including the new image "myimage:latest".

7. You can now use the new image to create new containers using the docker run command, or push it to a Docker registry like Docker Hub using the docker push command.

Using a Dockerfile to create a custom Docker image allows you to automate the process of building and configuring the image, and to easily reproduce and share the image with others. It also provides a more reliable and consistent way of building and deploying applications in containers.

## Persistent Data: Volumes

Docker volumes provide a way to persist data between containers and host machines, and to share data between containers. Here are some examples of how to use volumes in Docker:

1. Creating a volume

    To create a new volume in Docker, you can use the docker volume create command, like this:

```bash
docker volume create myvolume
```
        This will create a new Docker volume called "myvolume".

2. Mounting a volume to a container

    To mount a volume to a container, you can use the -v or --mount option when running the docker run command, like this:

```bash
docker run -v myvolume:/data myimage
```

        This will start a new container from the "myimage" image, and mount the "myvolume" volume to the "/data" directory in the container. Any data written to "/data" in the container will be stored in the volume and persisted across container restarts.

3. Listing volumes

    To list all Docker volumes on your system, you can use the docker volume ls command, like this:

```bash
docker volume ls
```

        This will show a list of all Docker volumes on your system, including the names and driver types of each volume.

4. Removing a volume

    To remove a Docker volume, you can use the docker volume rm command, like this:

```bash
docker volume rm myvolume
```

        This will remove the "myvolume" Docker volume from your system. Note that you cannot remove a volume that is currently mounted to a container.

Using Docker volumes allows you to store and persist data separately from the container file system, and to share data between multiple containers. Volumes can be used to store application data, configuration files, logs, and other types of persistent data. By using volumes, you can create more robust and scalable Docker deployments, and avoid data loss or corruption when containers are stopped or restarted.

