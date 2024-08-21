param(
  [int]$minutes
)

$endTime = (Get-Date).AddMinutes($minutes)

Write-Output "Staying active for $minutes minute(s)."

while ((Get-Date) -lt $endTime) {
  Add-Type -AssemblyName System.Windows.Forms
  [System.Windows.Forms.Cursor]::Position = [System.Windows.Forms.Cursor]::Position
  [System.Windows.Forms.SendKeys]::SendWait("{LEFT}") # Simulate a left-click
  Write-Output "[Simulating Click]"
  Start-Sleep -Seconds 5
}

Write-Output "Finished clicking after $minutes minute(s)."