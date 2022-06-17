@ECHO OFF
title Onboard PS/2 KB On/Off - YED KRiZ
CLS

ECHO This App will try to disable onboard keyboard 
ECHO in Laptops/Notebooks having PS/2 interface.
ECHO.
ECHO 1. Enable Keyboard
ECHO 2. Disable Keyboard
ECHO 3. Exit this Application
ECHO.

CHOICE /C 123 /M "Enter your choice:"

:: Note - list ERRORLEVELS in decreasing order
IF ERRORLEVEL 3 GOTO Exit
IF ERRORLEVEL 2 GOTO DisableKB
IF ERRORLEVEL 1 GOTO EnableKB

:EnableKB
ECHO.
ECHO Enabling Keyboard...
ECHO.
sc config i8042prt start= auto
pause
GOTO Restart

:DisableKB
ECHO.
ECHO Disabling Keyboard...
ECHO.
sc config i8042prt start= disabled
pause
GOTO Restart

:Restart
CLS
ECHO Restart Your Computer To Make The Changes.
ECHO.
ECHO Do You Want To Restart Your Computer Now?
ECHO 1. Restart Now
ECHO 2. Don't Restart
ECHO.

CHOICE /C 12 /M "Enter your choice:"
IF ERRORLEVEL 2 GOTO DontRestart
IF ERRORLEVEL 1 GOTO RestartNow

:DontRestart
ECHO Restart Cancelled!
ECHO.
GOTO ExitThisApplication

:RestartNow
ECHO.
ECHO Restarting...
Timeout 3 > null
shutdown.exe /r /t 0
GOTO Exit

:ExitThisApplication
ECHO.
ECHO Exiting this Application...
Timeout 3 > null
GOTO Exit

:Exit
exit