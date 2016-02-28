# docker-offline-install
Instructions and scripts for installing Docker Engine in an offline / standalone environment.

This is usefull for installing Docker engine on servers that don't or cannot have an internet connection.
Usually you would install Docker using apt-get, but that of course requires the server to be connected to the internet.
One solution is to mirror the entire Ubuntu [apt] repository, but because of its size, this solution is not practical.

Thankfully, Docker manages there own [apt] repository for the Docker-Engine, including direct dependencies.
Using a seperate internet connected (online) computer, you can download the Docker [apt] repository, copy it using some media (i.e. cdrom, usb) to the target computer / server and install it using apt-get.

The included scipts utilize [**apt-mirror**](http://apt-mirror.github.com) for downloading the Docker [apt] repository.
The official Docker documentation for [installing Docker on Ubuntu](https://docs.docker.com/engine/installation/linux/ubuntulinux/) was also helpful writing these scripts. Make sure you comply to Docker's prerequisites before trying to install on Ubuntu.

Currently only Ubuntu 14.04 is supported on both *source* (online) and *target* (offline) computers.

## Prerequisites:
* An online computer running Ubuntu 14.04 64-bit (a.k.a *source*)
* An offline / standalone computer running Ubuntu 14.04 64-bit (a.k.a *target*)
* **sudo** (*root*) privileges on both *source* and *target* computers
* Some sort of media to copy the included scripts and mirrored repository to the *target*
 

## Instructions
***
**Please Note:** Currently, the scripts are success oriented, no error checking is done. 
Please check the console output for any warnings/errors that may occur during the process.
***

### On the source (online) computer:
1. [Download](https://github.com/meetyg/docker-offline-install/archive/master.zip) the scripts, or clone using git.
2. Extract the zip (you might need to install unzip).
3. cd into the relevant distribution directory of the scripts (currently only Ubuntu14.04)
   `cd Ubuntu14.04`
4. Run the download script with sudo: `sudo ./docker-download.sh`
5. If all goes well, there should be gzip file named *docker_mirror.tar.gz* in the directory you ran the script from.
   Copy this file, **and** the *docker-install.sh* script to your media (i.e. cdrom, usb etc...)

### On the target (offline) computer:
1. Copy the *docker_mirror.tar.gz* and the *docker-install.sh* from the media to a writeable directory on the target.
2. Run the install script with sudo: `sudo ./docker-install.sh` (no need to extract the gzip, the script will do it for you).
3. If all goes well, Docker should be installed now. Test the installation by running: `docker ps`, you should get an empty list of running containers.

Thats it!




