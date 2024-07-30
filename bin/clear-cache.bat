@echo off
echo System Cleanup Script
echo =====================

:: Delete temporary files
echo Deleting temporary files...
del /s /q %temp%\*

:: Clear DNS cache
echo Clearing DNS cache...
:: Request confirmation to proceed
set /p confirm=Do you want to proceed? (yes/no): 
if /i "%confirm%"=="yes" (
    echo Proceeding with flushing DNS.
    ipconfig /flushdns
) else (
    echo DNS flush skipped.
)


:: Clear Windows Update cache
echo Clearing Windows Update cache...
:: Request confirmation to proceed
set /p confirm=Do you want to proceed? (yes/no): 
if /i "%confirm%"=="yes" (
    echo Proceeding with clearing Windows update cache.
    net stop wuauserv
    del /s /q C:\Windows\SoftwareDistribution\Download\*
    net start wuauserv
) else (
    echo Clearing Windows Update cache skipped.
)

:: Clear Recycle Bin
echo Emptying Recycle Bin...
if /i "%confirm%"=="yes" (
    echo Proceeding with emptying recycle bin. 
    rd /s /q C:\$Recycle.Bin
) else (
    echo Emptying recycle bin skipped.
)

echo Cleanup complete!