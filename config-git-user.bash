#!/bin/bash

if [ ! -e /etc/debian_version ]; then
	echo "This script is only meant for Debian"
	exit 1
fi

if [ "$EUID" -ne 0 ]; then
	echo "Please run as root"
	exit 1
fi

if [ ! -e `which ssh` ]; then
	echo "Installing ssh"
	apt update && apt install ssh || exit 1
fi

if [ ! -e `which git` ]; then
	echo "Installing git"
	apt update && apt install git || exit 1
fi

githome='/home/git'

adduser git

chsh git -s `which git-shell`

mkdir $githome/.ssh &&

chmod 700 $githome/.ssh

touch $githome/.ssh/authorized_keys &&

chmod 600 $githome/.ssh/authorized_keys

chown -R git:git $githome/
