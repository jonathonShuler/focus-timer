# User inputs a timer length or leaves input blank for infinite timer
# Counts down for specified time or up for infinite
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

Write-Output $timerLength