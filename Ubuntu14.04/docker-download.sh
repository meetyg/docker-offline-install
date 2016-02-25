# Run the follwing command with su privileges
sudo -i

# Update apt, install apt secure transport and cerificates, and apt-mirror 
apt-get update
apt-get -y install apt-transport-https ca-certificates apt-mirror

# Get Docker's public key and add it to apt for package signiture verification
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# Add Docker's apt repo to apt-mirror's mirror list
echo deb https://apt.dockerproject.org/repo ubuntu-trusty main > /etc/apt/mirror.list

# Run apt-mirror to download Docker repo to current directory
apt-mirror

# Save Docker's public key to the mirror directory
apt-key export 58118E89F3A912897C070ADBF76221572C52609D > /var/spool/apt-mirror/mirror/apt.dockerproject.org/docker.key

# Return to user
exit

cd ~

# Compress the mirror dir to an archive file in the current directory
tar -cvzf docker_mirror.tar.gz -C /var/spool/apt-mirror/mirror apt.dockerproject.org

