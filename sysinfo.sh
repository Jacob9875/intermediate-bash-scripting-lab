#!/bin/bash

# Function to print a header with a timestamp
print_header() {
    local title="$1"
    local timestamp
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo ""
    echo "=============================================="
    echo " $title"
    echo " Generated on: $timestamp"
    echo "=============================================="
    echo ""
}


# Check for -h or --help argument
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Usage: $0 [options]"
    echo ""
    echo "This script is a menu-driven utility that allows you to:"
    echo "  1: Show System Information"
    echo "  2: Show Disk Usage"
    echo "  3: Show Current Users and their Running Processes"
    echo "  4: Show Top 5 CPU-intensive Processes"
    echo "  5: Exit"
    echo ""
    echo "Run the script without arguments to enter the interactive menu."
    exit 0
fi

while true; do
    echo ""
    echo "=============================================="
    echo "          Menu-Driven Bash Script"
    echo "=============================================="
    echo "Welcome, select one of the following options using the number keys:"
    echo "1: Show System Info"
    echo "2: Show Disk Usage"
    echo "3: Show Current Users"
    echo "4: Show Top Processes"
    echo "5: Exit"
    echo "=============================================="

    read -p "Enter your choice: " choice

    if [ "$choice" = "1" ]; then
        print_header "System Information"

        echo "OS Name and Version: $(lsb_release -d | cut -f2)"
        echo "Hostname: $(hostname)"
        echo "Kernel Version: $(uname -r)"
        echo "System Uptime: $(uptime -p)"
        echo "----------------------------------------------"
        

    elif [ "$choice" = "2" ]; then
        print_header "Disk Usage"

        df -h --output=source,fstype,size,used,avail,pcent,target


    elif [ "$choice" = "3" ]; then
        print_header "Current Users and Their Running Applications"

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
        print_header "Top 5 CPU-intensive Processes"
        ps -eo pid,user,pcpu,comm --sort=-pcpu | head -n 6
        

    elif [ "$choice" = "5" ]; then
        echo "Exiting the script"
        break
    
    else
        echo "Invalid option, please try again."
    fi

done

