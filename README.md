# Firewall Blocker

**Firewall Blocker** is a simple Windows batch script designed to block network connections for specific executable and script files in a folder. It allows users to quickly prevent programs from accessing the internet by creating inbound and outbound firewall rules.

## Features

- **Selective Blocking**: Choose to block connections for files in the current folder only, or include all subfolders.  
- **Supported File Types**: `.exe`, `.msi`, `.bat`, `.vbs`, `.ps1`  
- **Automatic Firewall Rules**: Adds both inbound and outbound rules for each detected file.  
- **Absolute Path Display**: Shows the full path of each file for which network connections are blocked.  

## Usage

1. Place the script in the folder you want to scan.  
2. Run the batch file.  
3. Select the desired scan mode from the menu.  
4. The script will display blocked files and add corresponding firewall rules.

**Note**: Requires administrative privileges to modify Windows Firewall rules.
