#!/bin/bash

user=${1}

sudo deluser $user
wait
sudo rm -r /home/$user
