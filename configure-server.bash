#!/bin/bash
# Note: This script does not install ssh for you
if [ "$EUID" -ne 0 ]; then
	echo "Please run as root"
	exit 1
elif [ ! -e `which ssh` ]; then
	echo "Install ssh"
	exit 1
fi

githome='/home/git'

adduser git

chsh git -s `which git-shell`

mkdir $githome/.ssh &&

chmod 700 $githome/.ssh

touch $githome/.ssh/authorized_keys &&

chmod 600 $githome/.ssh/authorized_keys

chown -R git:git $githome/
