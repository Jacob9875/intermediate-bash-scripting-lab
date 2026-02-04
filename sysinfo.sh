#!/bin/bash

echo "Menu-Driven Bash Script"

echo "Welcome, select one of the following options using the number keys:"
echo "1: Show CPU Info"
echo "2: Show GPU Usage"
echo "3: Show Log Files"
echo "4: Show VRAM usage"
echo "5: Exit"

read choice

if [ "$choice" = "1" ]; then
  echo "You selected Option 1"
elif [ "$choice" = "2" ]; then
  echo "You selected Option 2"
elif [ "$choice" = "3" ]; then
  echo "You selected Option 3"
elif [ "$choice" = "4" ]; then
  echo "You selected Option 3"
elif [ "$choice" = "5" ]; then
  echo "Exiting the script"
  exit
else
  echo "Invalid option"
fi

chmod +x sysinfo.sh
