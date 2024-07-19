@echo off
echo System Cleanup Script
echo =====================

:: Delete temporary files
echo Deleting temporary files...
del /s /q %temp%\*

:: Clear DNS cache
echo Clearing DNS cache...
ipconfig /flushdns

:: Clear Windows Update cache
echo Clearing Windows Update cache...
net stop wuauserv
del /s /q C:\Windows\SoftwareDistribution\Download\*
net start wuauserv

:: Clear Recycle Bin
echo Emptying Recycle Bin...
rd /s /q C:\$Recycle.Bin

echo Cleanup complete!