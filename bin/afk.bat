@echo off

if "%1"=="" (
    echo Please provide number of minutes.
    echo Usage: afk.bat ^<minutes^>
    exit /b 1
)

set %time%=%1
echo Calling afk.py. Running for %time% minutes
python afk.py %time%