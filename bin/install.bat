@echo off
setlocal

:: Check if python is installed
echo Checking for Python installation...
python --version >nul 2>&1
:: Check if python --version returned an error > if it did, install python
if %errorlevel% neq 0 (
    echo Python is not installed. Downloading and installing Python for Windows...
    powershell -Command "Start-BitsTransfer -Source https://www.python.org/ftp/python/3.9.13/python-3.9.13-amd64.exe -Destination python-installer.exe"
    echo Python installer downloaded. Running python-installer.exe
    echo If prompted: allow Python to make changes to your system
    python-installer.exe /quiet InstallAllUsers=1 PrependPath=1
    :: Check if python installation was successful
    if %errorlevel% neq 0 (
        echo Python installation failed. Please install it manually.
        exit /b 1
    )
    echo Python installed successfully.
) else (
    echo Python is already installed.
)

:: Check if pip is installed
echo Checking for pip installation...
pip --version >nul 2>&1
if %errorlevel% neq 0 (
    echo pip is not installed. Installing pip...
    python -m ensurepip --default-pip
    :: Check if installing pip was successful
    if %errorlevel% neq 0 (
        echo pip installation failed. Exiting.
        exit /b 1
    )
    echo pip installed successfully.
) else (
    echo pip is already installed.
)

:: Install requests using pip
echo Installing required libraries...
pip install PyAutoGUI
if %errorlevel% neq 0 (
    echo Failed to install libraries. Exiting.
    exit /b 1
)
echo Libraries installed successfully.

echo All tasks completed successfully.
pause
