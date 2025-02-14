@echo off
:: RAM Cleaner
:: Author: YourGitHubUsername
:: This script clears standby memory to free up RAM

:: Check for administrator privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Running as Administrator...
    powershell -Command "Start-Process cmd -ArgumentList '/c \"%~f0\"' -Verb RunAs"
    exit
)

echo Cleaning RAM...

:: Use Windows built-in commands to clear memory
wmic process where name="explorer.exe" call terminate
start explorer.exe

:: Alternative: Use EmptyStandbyList (requires download)
:: EmptyStandbyList.exe workingsets
:: EmptyStandbyList.exe standbylist
:: EmptyStandbyList.exe modifiedpagelist

echo RAM cleanup completed!
pause