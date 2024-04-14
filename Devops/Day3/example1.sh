#!/bin/bash
echo "enter the username"
read username
echo "your username is $username"

read -p "enter new username:" newusername
echo "new username is $newusername"

read -sp "please enter password" password
echo ""
echo "$password"
