@echo off
setlocal enableextensions
cd /d "%~dp0"

:menu
cls
echo Firewall Blocker tool
echo.
echo Choose scan mode:
echo.
echo [1] Only current folder
echo [2] Current folder + subfolders
echo [3] Exit
echo.
set /p choice=Enter choice: 
echo.

set "extensions=*.exe *.msi *.bat *.vbs *.ps1"

if "%choice%"=="1" (
    echo Scanning only current folder...
    for %%f in (%extensions%) do (
        netsh advfirewall firewall show rule name="Blocked: %cd%\%%f" >nul 2>&1
        if errorlevel 1 (
            netsh advfirewall firewall add rule name="Blocked: %cd%\%%f" dir=out program="%%~f" action=block >nul
            netsh advfirewall firewall add rule name="Blocked: %cd%\%%f" dir=in program="%%~f" action=block >nul
            echo Blocked connections for %cd%\%%f
        )
    )
    pause
    goto menu
)

if "%choice%"=="2" (
    echo Scanning current folder and subfolders...
    for /R %%f in (%extensions%) do (
        netsh advfirewall firewall show rule name="Blocked: %%~f" >nul 2>&1
        if errorlevel 1 (
            netsh advfirewall firewall add rule name="Blocked: %%~f" dir=out program="%%~f" action=block >nul
            netsh advfirewall firewall add rule name="Blocked: %%~f" dir=in program="%%~f" action=block >nul
            echo Blocked connections for %%~f
        )
    )
    pause
    goto menu
)

if "%choice%"=="3" (
    echo Exiting...
    exit /b
)

echo Invalid choice. Please select 1-3.
pause
goto menu
