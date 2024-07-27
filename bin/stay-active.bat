@echo off
if "%1"=="" (
    echo Please provide number of minutes.
    echo Usage: stay-active.bat <minutes>
    exit /b 1
)

set %time%=%1
echo Calling stay-active.py. Running for %time% minutes
python stay-active.py %time%