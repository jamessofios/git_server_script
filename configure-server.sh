#!/bin/sh

githome='/home/git'

sudo adduser git

sudo chsh git -s $(which git-shell)

sudo mkdir $githome/.ssh &&

sudo chmod 700 $githome/.ssh

sudo touch $githome/.ssh/authorized_keys &&

sudo chmod 600 $githome/.ssh/authorized_keys
