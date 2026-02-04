#!/bin/bash

echo "Menu-Driven Bash Script"

echo "Welcome, select one of the following options using the number keys:"
echo "1: Show System Info"
echo "2: Show Disk Usage"
echo "3: Show Current Users"
echo "4: Show VRAM usage"
echo "5: Exit"

read -p "Enter your choice: " choice

if [ "$choice" = "1" ]; then
  echo "=== System Information ==="

  echo "OS Name and Version: $(lsb_release -d | cut -f2)"

  echo "Hostname: $(hostname)"

  echo "Kernel Version: $(uname -r)"

  echo "System Uptime: $(uptime -p)"
  
elif [ "$choice" = "2" ]; then
  echo "You selected Option 2"
elif [ "$choice" = "3" ]; then
  echo "You selected Option 3"
elif [ "$choice" = "4" ]; then
  echo "You selected Option 4"
elif [ "$choice" = "5" ]; then
  echo "Exiting the script"
  exit
else
  echo "Invalid option"
fi


