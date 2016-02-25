# Run the follwing command with su privileges
sudo -i

# Update apt, install apt secure transport and cerificates, and apt-mirror 
apt-get update
apt-get install apt-transport-https ca-certificates apt-mirror

# Get Docker's public key and add it to apt for package signiture verification
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# Add Docker's apt repo to apt-mirror's mirror list
echo deb https://apt.dockerproject.org/repo ubuntu-trusty main > /etc/apt/mirrors.list

# return to user privileges
exit

# Create target directory for Docker repo that will be downloaded
mkdir docker_pkgs
cd docker_pkgs

# Save Docker's public key to current directory
apt-key export 58118E89F3A912897C070ADBF76221572C52609D > docker.key

# Run apt-mirror to download Docker repo to current directory
apt-mirror

cd ..

# Compress the dir to an archive file
tar -cvvf docker_pkgs.tar.gz docker_pkgs/

