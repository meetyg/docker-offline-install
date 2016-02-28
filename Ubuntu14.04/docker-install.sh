#!/usr/bin/env bash

# Create a directory for mirrored repositories
mkdir -p /var/deb/apt-mirror

# Extract mirrored repository
tar -xvzf docker_mirror.tar.gz -C /var/deb/apt-mirror/

# Add local Docker mirror to apt-get sources list
echo 'deb [arch=arm64] file:///var/deb/apt-mirror/apt.dockerproject.org/repo  ubuntu-trusty main' > /etc/apt/sources.list.d/docker_local.list

# Add the Docker public key to apt-get so that it can verify the package signitures
apt-key add /var/deb/apt-mirror/apt.dockerproject.org/docker.key

# Run apt-get update so that apt will recognize new local repo added in previous step
apt-get update

# Install Docker engine
apt-get install docker-engine

