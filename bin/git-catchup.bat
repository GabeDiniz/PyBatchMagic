@echo off
setlocal

:: Set path to your local repo(s) here
:: REPO 1
set repoDir=C:\path\to\your\repo
echo Navigating to repository directory...
cd %repoDir%
echo Pulling latest changes...
git pull origin main
echo Pull complete!

:: REPO 2
set repoDir=C:\path\to\your\repo
echo Navigating to repository directory...
cd %repoDir%
echo Pulling latest changes...
git pull origin main
echo Pull complete!