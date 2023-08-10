# Installing Docker for Ignition Development

## Install Windows Subsystem for Linux (WSL)

1. Launch Command Prompt with `Win+R` and then type `cmd`.
2. Run the following command: `wsl --install -d Ubuntu`, 
   then restart your computer for the WSL installation to take affect.
3. Install the [WSL 2 Kernel](https://learn.microsoft.com/en-us/windows/wsl/install-manual#step-4---download-the-linux-kernel-update-package)
4. After the installation, change the default version with `wsl --set-version Ubuntu 2`.
5. After changing the default version, run `wsl --update` to make sure the kernel is fully up to date.
6. Once update is complete, create credentialsw for the 'Ubuntu for Windows' application that was installed or by typing `wsl` in command prompt.

*The entry prompt will not show any characters as you type your password.*

## Program installation

Install the following programs:

1. [Visual Studio Code](https://code.visualstudio.com/Download)

	Visual Studio Code also needs the following extensions:

	- [Remote Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)
	- [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
	- [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)

2. [Git for Windows](https://gitforwindows.org/)
   1. From the "Choosing default editor used by git" page
   2. Select "Use Visual Studio Code" as the default editor.

## Install and Set Up Docker Inside WSL Ubuntu

Docker is a tool that makes it easy to set up containerized applications from existing images. Your Ignition development environment will live inside a Docker container.

We will not be using Docker Desktop for Windows for this project. We will instead be downloading and installing Docker onto Ubuntu within WSL.

**All commands in this section will need to be run in WSL Ubuntu**.

### Install Docker

From inside VS Code, ``CTRL+Shift+` `` to open a terminal panel.

 Check the '>' icon at the top right of the terminal panel says 'wsl'. To change to wsl the plus '+' icon has a drop down menu that can select/ change the default terminal profile to 'wsl'.

1. Update list of available packages with `sudo apt update`. Enter your password as well.
2. Install Docker with `sudo apt install docker.io -y`.
3. Check the Docker installation by running `docker --version`.

### Configure WSL to Launch Docker at Startup

1. Open file that controls sudo command execution: `sudo visudo`.
2. Add the following code to the end of your file. ("yourusername" is the ubuntu username you set).

	```bash
	# Docker daemon specification
	yourusername ALL=(ALL) NOPASSWD: /usr/bin/dockerd
	```

3. Press `CTRL+X` to exit.
4. Press `Y` to confirm save.
5. Press `ENTER` to confirm file name.
6. Open bash configuration file in vs-code: `code ~/.bashrc`. It will install vs-code server in WSL, making it easier to access these files in the future. Note: if you have isssues on this step, you may need to reboot your host computer.
7. Add the following to the end of the file:

	```bash
	# Start Docker daemon automatically when logging in if not running.
	RUNNING=`ps aux | grep dockerd | grep -v grep`
	if [ -z "$RUNNING" ]; then
		sudo dockerd > /dev/null 2>&1 &
		disown
	fi
	```

8. Save and quit.
9. Add your username to the docker group so Docker can be ran as a non-root user. `sudo usermod -aG docker $USER`.
10. Close and re-open VS Code, this should force you to re-log into ubuntu
11. Verify the installation of docker with `docker ps`. If you see `CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES` then docker is correctly installed and running.

### Install Docker Compose

1. Download the latest version of Docker Compose:

	```bash
	sudo curl -kL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
	```

2. Apply executable permissions to the binary: `sudo chmod +x /usr/local/bin/docker-compose`.
3. Verify Docker Compose installation: `docker-compose --version`.
