#!/bin/sh -x

which brew >/dev/null 2>&1
if [ $? -ne 0 ];
then
  echo "not found command brew"
  echo "install brew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

which wget >/dev/null 2>&1
if [ $? -ne 0 ];
then
  echo "not found command wget"
  echo "install wget"
  brew install wget
fi

which pip >/dev/null 2>&1
if [ $? -ne 0 ];
then
  echo "not found command pip"
  echo "install pip"
  curl https://bootstrap.pypa.io/get-pip.py > ./get-pip.py
  sudo python ./get-pip.py
  rm ./get-pip.py
fi

sudo which ansible >/dev/null 2>&1
if [ $? -ne 0 ];
then
  echo "not found command ansible"
  echo "install ansible"
  sudo pip install ansible
fi
