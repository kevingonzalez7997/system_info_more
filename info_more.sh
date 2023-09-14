#!/bin/bash

echo "Welcome to system_info_more"
sleep 2
echo ""
echo "You will be able to pick from different system options and take a more detailed look"
sleep 2
echo ""
echo "Lets get started!"
sleep 2
echo ""
# All the code goes in the while loop so it can keep printing the menu until it breaks out
while true; do
    # just to make user experince better and easier
    echo "--------------------------------------------------------------------------------"
    echo ""
    echo "System Information Menu"
    echo "0) Exit"
    echo "1) Currently logged users"
    echo "2) Your shell directory"
    echo "3) Home Directory"
    echo "4) OS name & version"
    echo "5) Current working directory"
    echo "6) Number of users logged in"
    echo "7) Hard disk information"
    echo "8) CPU information"
    echo "9) Memory information"
    echo "10) File system information"
    echo "11) Currently running processes"
    echo ""

    # Collect user input and store it in
    read -p "Please enter your choice: " choice

    case $choice in
        # This is how we will break out of the while loop
        0) echo "Exiting . . ."
                break ;;
        # This is to get the logged in user
        1) user=$(whoami)
                echo ""
                echo "Currently the logged user is: $user"
                ;;
        # SHELL is built in to show the shell directory
        2) Shell_directory="$SHELL"
                echo ""
                echo "The shell Directory is: $Shell_directory"
                ;;
        # HOME is also a built in command that returns the home directory
        3) home="$HOME"
                echo ""
                echo "The Home Directory is: $home"
                ;;
        # uname is built in comand but the flags are very imprtant
        # The -r flag shows the version number of the true os, this is help when using VM
        4) os=$(uname)
           os_version=$(uname -r)
                echo ""
                echo "The OS name and Version is: $os, $os_version"
                ;;
        # The good old handy pwd command to show to current directoery
        5) current_directory=$(pwd)
                echo ""
                echo "The CWD is : $current_directory"
                ;;
        # w command gives important information about who is currently using the computer, how much the computer is being used.
        6) user=$(w)
                echo ""
                echo "The users logged in are: $user"
                ;;
        # df diskfree with the -h flag to make it easier to read for humans
        7) Disk_info=$(df -h)
                echo ""
                echo "The current HardDisk information is: $Disk_info"
                ;;
        # There is a directory proc with alot of system information files
        8) cpu_info=$(cat /proc/cpuinfo)
                echo ""
                echo "The current CPU info is: $cpu_info"
                ;;
        # free shows the memory status while the -m flag puts it in mb for easier read
        9) Mem_free=$(free -m)
                echo ""
                echo "The Memory used is: $Mem_free"
                ;;
        # Same df command as before but the T flag to show the file system type
        10) File_sys=$(df -T)
                echo ""
                echo "The File system information type is: $File_sys"
                ;;
        # process staus, ps,  command used with aux which is
        # a = show processes for all users
        # u = display the process's user/owner
        # x = also show processes not attached to a terminal
        11) processes=$(ps aux)
                echo ""
                echo "The Proccesses running at the moment are: $processes"
                ;;
        # catches all other options
        *) echo ""
           echo "That is not a valid answer"
                ;;
        esac
done
