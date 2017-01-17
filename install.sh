#!/bin/bash

# To get latest package lists
apt-get update

# Pre-Setup

## Tmux
apt-get install -y tmux

## Git/Java
apt-get install -y g++ curl libssl-dev apache2-utils git-core
add-apt-repository ppa:webupd8team/java
apt-get update
apt-get -y install oracle-java8-installer

## Chrome
apt-get install -y libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt-get install -f
dpkg -i google-chrome*.deb

## Sublime Text-3
add-apt-repository ppa:webupd8team/sublime-text-3
apt-get update
apt-get install sublime-text-installer -y

# Google App Engine SDK
Create an environment variable for the correct distribution
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"

Add the Cloud SDK distribution URI as a package source
echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

Import the Google Cloud Platform public key
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

Update the package list and install the Cloud SDK
sudo apt-get update && sudo apt-get install -y google-cloud-sdk

## Virtual-Box
apt-get install virtualbox -y

## Vagrant
apt-get install vagrant -y
vagrant box add precise32 http://files.vagrantup.com/precise32.box

# MEAN Stack Setup

## Node.js
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
apt-get install -y nodejs

## MongoDb
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo "deb http://repo.mongodb.org/apt/debian wheezy/mongodb-org/3.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
apt-get update
apt-get install -y mongodb-org

### Additional Setup for mongodb
# Create a /data/db directory and open the MongoDB configuration file in a text editor of your choice.
# sudo mkdir -p /data/db
# sudo gedit /etc/mongod.conf
# Replace dbpath=/var/lib/mongodb with dbpath=/data/db and then save the file.
# sudo chown -R mongodb:mongodb /data/db
# Now, you are good to go. Start mongodb normally by issuing the following commad:
# sudo service mongod start
# To check the service status, use the command:
# sudo systemctl status mongod 

## Bower
npm install -g bower

## Grunt and Gulp
npm install -g grunt-cli
npm install -g gulp-cli

# Utilities
# apt-get install vim -y
##Heroku Setup
add-apt-repository "deb https://cli-assets.heroku.com/branches/stable/apt ./"
curl -L https://cli-assets.heroku.com/apt/release.key | sudo apt-key add -
apt-get update
apt-get install heroku
