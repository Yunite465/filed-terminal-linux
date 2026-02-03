# filed-terminal-linux
simple bash script that allows you to use terminal through .md files (It was actually designed for remote PC control via Obsidian and Syncthing.)
# Installation
To install, simply clone repo

# Usage
Inside the project directory, locate the config.conf file. Insert the path to the folder where your operational files will be stored.
The program utilizes three files: in.md, out.md, and status.md.
## in.md
The program monitors this file for commands. Commands follow this syntax: Your command -run. Once the -run flag is detected, the script executes the command.
## out.md
This file contains the program output.
⚠️ CAUTION: When a second command is executed, the previous output is overwritten!
## status.md
Contains any relevant system information you may need.

# ⚠️ Warning
USE PRIVATE REPOSITORIES ONLY! Anyone with permission to edit in.md can execute any command on your PC.
