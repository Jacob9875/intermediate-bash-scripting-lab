#!/bin/bash

while true; do
    echo ""
    echo "Menu-Driven Bash Script"
    echo "======================="
    echo "Welcome, select one of the following options using the number keys:"
    echo "1: Show System Info"
    echo "2: Show Disk Usage"
    echo "3: Show Current Users"
    echo "4: Show Top Processes"
    echo "5: Exit"

    read -p "Enter your choice: " choice

    if [ "$choice" = "1" ]; then
        echo "=== System Information ==="

        echo "OS Name and Version: $(lsb_release -d | cut -f2)"

        echo "Hostname: $(hostname)"

        echo "Kernel Version: $(uname -r)"

        echo "System Uptime: $(uptime -p)"

    elif [ "$choice" = "2" ]; then
        echo "=== Disk Usage ==="

        df -h --output=source,fstype,size,used,avail,pcent,target


    elif [ "$choice" = "3" ]; then
        echo "=== Current Users and Their Running Applications ==="

        echo "Logged-in users:"
        who | awk '{print $1}' | sort | uniq

        echo ""
        echo "Applications/processes for each user:"

        for user in $(who | awk '{print $1}' | sort | uniq); do
            echo ""
            echo "User: $user"
            echo "---------------------------"

            ps -u $user -o pid,cmd --sort=pid
        done


    elif [ "$choice" = "4" ]; then
        echo "=== Top 5 CPU-intensive Processes ==="
        ps -eo pid,pcpu,comm --sort=-pcpu | head -n 6
        ;;

    elif [ "$choice" = "5" ]; then
        echo "Exiting the script"
        break
    
    else
        echo "Invalid option, please try again."
    fi

done

