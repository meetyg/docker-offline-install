# docker-offline-install
Instructions and scripts for installing Docker Engine in an offline /standalone environment.

This is usefull for installing Docker engine on servers that don't have, or cannot have an internet connection.
Usually you would install using apt-get, but that of course requires the server to be connected to the internet.
Using a seperate internet connected (online) computer, you can download the Docker apt repository, copy it using some media (i.e. cdrom, usb) to the target computer / server and install it using apt-get.

The included scipts utilize [**apt-mirror**](http://apt-mirror.github.com) for downloading the Docker repository.
The official Docker documentation for [installing Docker on Ubuntu](https://docs.docker.com/engine/installation/linux/ubuntulinux/) was also helpful writing these scripts. Make sure you comply to Docker's prerequisites before trying to install on Ubuntu.

Currently only Ubuntu 14.04 is supported on both *source* (online) and *target* (offline) computers.


## Prerequisites:
* An online computer running Ubuntu 14.04 64-bit (a.k.a *source*)
* An offline / standalone computer running Ubuntu 14.04 64-bit (a.k.a *target*)

## Instructions



