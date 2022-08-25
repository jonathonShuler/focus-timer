# Writes timer status to a notepad file every 4 minutes

###############################

# 48 * 300 = 4 hours

# param($numLoops = 48)

# $myshell = New-Object -com "Wscript.Shell"

# for ($i = 0; $i -lt $numLoops; $i++) {
#        Start-Sleep -Seconds 300
#        $myshell.sendkeys("+")
# }
################################



function Get-Minutes
{
    try
    {
        [uint16]$userInput = Read-Host "Enter the number of minutes, or leave blank."
    }
    catch [System.Management.Automation.RuntimeException]
    {
        Write-Host "Invalid Input. Please enter a number from 0 to 65535."
        Get-Minutes
    }

    return $userInput
}

$timerLength = Get-Minutes

# Open Notepad and create .txt file if not already present.

if ($timerLength -gt 0)
{
    for ($i = $timerLength; $i -gt 0; $i--)
    {
        Write-Output "Minutes Remaining: $i" # Convert this to send keys to Notepad file.
        Start-Sleep -Seconds 60
    }

    Write-Output "Time's Up!"
}
else 
{
    $i = 0
    while ($true)
    {
        Write-Output "Minutes Counted: $i"  # Convert this to send keys to Notepad file.
        Start-Sleep -Seconds 60
        $i++
    }
}
