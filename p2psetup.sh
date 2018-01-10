#!/bin/bash

#Add date to now string variable

DATE=$(date +%F)
TIME=$(date +%T)
now=$DATE-$TIME

#Update OS files
sudo apt-get update >$now-p2pool.log
sudo apt-get -y dist-upgrade >>$now-p2pool.log

#For General Building and cloning
sudo apt-get -y install git >>$now-p2pool.log
sudo apt-get -y install git-core >>$now-p2pool.log
sudo apt-get -y install make >>$now-p2pool.log
sudo apt-get -y install gcc >>$now-p2pool.log
sudo apt-get -y install g++ >>$now-p2pool.log
sudo apt-get -y install m4 >>$now-p2pool.log
sudo apt-get -y install autotools-dev >>$now-p2pool.log
sudo apt-get -y install automake >>$now-p2pool.log
sudo apt-get -y install build-essential >>$now-p2pool.log
sudo apt-get -y install autoconf >>$now-p2pool.log

#Multiplexer
sudo apt-get -y install tmux >>$now-p2pool.log

#dyndns updater
sudo apt-get -y install libio-socket-ssl-perl >>$now-p2pool.log
sudo apt-get -y install ddclient >>$now-p2pool.log

#Firewall
sudo ufw allow ssh/tcp >>$now-p2pool.log
#sudo ufw limit ssh/tcp >>$now-p2pool.log
sudo ufw allow 7903 >>$now-p2pool.log
sudo ufw allow 9998/tcp >>$now-p2pool.log
sudo ufw allow 9999/tcp >>$now-p2pool.log
sudo ufw logging on >>$now-p2pool.log

#Swapfile
sudo fallocate -l 4G /swapfile >>$now-p2pool.log
sudo chmod 600 /swapfile >>$now-p2pool.log
sudo mkswap /swapfile >>$now-p2pool.log
sudo swapon /swapfile >>$now-p2pool.log
sudo sed -i '$ a\/swapfile none swap sw 0 0' /etc/fstab  >>$now-p2pool.log

#For cgminer
#sudo apt-get -y install libudev-dev >>$now-p2pool.log
#sudo apt-get -y install libusb-1.0-0-dev >>$now-p2pool.log
#sudo apt-get -y install libfox-1.6-dev >>$now-p2pool.log
#sudo apt-get -y install libtool >>$now-p2pool.log
#sudo apt-get -y install libncurses-dev >>$now-p2pool.log
#sudo apt-get -y install yasm >>$now-p2pool.log
#sudo apt-get -y install pkg-config >>$now-p2pool.log
#sudo apt-get -y install uthash-dev >>$now-p2pool.log

#For wallets
#sudo apt-get -y install libpng-dev >>$now-p2pool.log
#sudo apt-get -y install libevent-dev >>$now-p2pool.log
#sudo apt-get -y install zlibc >>$now-p2pool.log
#sudo apt-get -y install zlib1g-dev >>$now-p2pool.log
#sudo apt-get -y install libjansson-dev >>$now-p2pool.log
#sudo apt-get -y install libcurl4-openssl-dev >>$now-p2pool.log
#sudo apt-get -y install qrencode >>$now-p2pool.log
#sudo apt-get -y install dh-make >>$now-p2pool.log
#sudo apt-get -y install dh-modaliases >>$now-p2pool.log
#sudo apt-get -y install execstack >>$now-p2pool.log
#sudo apt-get -y install libc6 >>$now-p2pool.log
#sudo apt-get -y install lib32gcc1 >>$now-p2pool.log
#sudo apt-get -y install qt4-qmake >>$now-p2pool.log
#sudo apt-get -y install libqt4-dev >>$now-p2pool.log
#sudo apt-get -y install libboost-dev >>$now-p2pool.log
#sudo apt-get -y install libboost-system-dev >>$now-p2pool.log
#sudo apt-get -y install libboost-filesystem-dev >>$now-p2pool.log
#sudo apt-get -y install libboost-program-options-dev >>$now-p2pool.log
#sudo apt-get -y install libboost-thread-dev >>$now-p2pool.log
#sudo apt-get -y install libssl-dev >>$now-p2pool.log
#sudo apt-get -y install libdb++-dev >>$now-p2pool.log
#sudo apt-get -y install libminiupnpc-dev >>$now-p2pool.log
#sudo apt-get -y install qt5-qmake >>$now-p2pool.log
#sudo apt-get -y install libqt5gui5 >>$now-p2pool.log
#sudo apt-get -y install libqt5core5a >>$now-p2pool.log
#sudo apt-get -y install libqt5dbus5 >>$now-p2pool.log
#sudo apt-get -y install qttools5-dev-tools >>$now-p2pool.log

#For checking CPU capabilities
sudo apt-get -y install cpuid >>$now-p2pool.log

#Install p2pool dependencies
sudo apt-get -y install libboost-all-dev >>$now-p2pool.log
sudo apt-get -y install libssl-dev >>$now-p2pool.log
sudo apt-get -y install libdb-dev >>$now-p2pool.log
sudo apt get -y install libdb++-dev >>$now-p2pool.log
sudo apt-get -y install python-dev >>$now-p2pool.log
sudo apt-get -y install python-zope.interface >>$now-p2pool.log
sudo apt-get -y install python-twisted >>$now-p2pool.log
sudo apt-get -y install python-twisted-web >>$now-p2pool.log

#Clone p2pool into home directory
#git clone https://github.com/vertoe/p2pool-drk
#git clone https://bitbucket.org/dstorm/p2pool-drk
git clone https://github.com/radawson/p2pdash
cd p2pdash
make clean
make
git clone https://github.com/radawson/dashhash
cd dashhash
rm -rf build
python setup.py install
cd ..
cd dash-subsidy-python
python setup.py install
cd ..
git clone https://github.com/darkcoinproject/xcoin-hash.git
cd xcoin-hash
python setup.py install
cd ~
git clone https://github.com/radawson/dashman
sudo ~/dashman/dashman install

#Build darkcoin subsidy
#sudo python ~/p2pool-drk/darkcoin-subsidy-python/setup.py install
#sudo python ~/p2pool-drk/setup.py install
