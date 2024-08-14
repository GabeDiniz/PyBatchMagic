import sys
import time
import pyautogui  # pip install pyautogui

def main(duration_minutes):
    duration_seconds = duration_minutes * 60
    end_time = time.time() + duration_seconds

    while time.time() < end_time:
        pyautogui.click()
        time.sleep(30)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python stay-active.py <minutes>")
        sys.exit(1)

    try:
        duration_minutes = float(sys.argv[1])
    except ValueError:
        print("Please provide a valid number for the duration.")
        sys.exit(1)

    main(duration_minutes)
