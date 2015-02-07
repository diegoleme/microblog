#!/usr/bin/env bash

### Install Linux packages
sudo apt-get update
sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties nfs-common portmap

# ### Install Ruby
cd /tmp
wget http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.5.tar.gz
tar -xvzf ruby-2.1.5.tar.gz
cd ruby-2.1.5
./configure --prefix=/usr/local
make
sudo make install
echo "gem: --no-document" > ~/.gemrc

### Install NodeJs
curl -sL https://deb.nodesource.com/setup | sudo bash -
sudo apt-get install -y nodejs

### Install MySQL
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"
sudo apt-get install -y mysql-server

cat << EOF | sudo tee -a /etc/mysql/conf.d/default_engine.cnf
[mysqld]
default-storage-engine = MyISAM
EOF

sudo service mysql restart

### Install Bundler
sudo gem install bundler

echo "You've been provisioned"
