@echo off
set /p duration="Enter the number of minutes to keep the system awake: "
set /a durationInSeconds=%duration% * 60

:AwakeLoop
if %durationInSeconds% leq 0 goto End
timeout /t 60 /nobreak
rem Simulate a key press (e.g., num lock)
(
    echo Set WshShell = WScript.CreateObject("WScript.Shell")
    echo WshShell.SendKeys "{NUMLOCK}"
) > temp.vbs
wscript temp.vbs
del temp.vbs

set /a durationInSeconds=%durationInSeconds% - 60
goto AwakeLoop

:End
echo System will now return to normal behavior.
