###################################################################
###################################################################

$wshell = New-Object -ComObject "Wscript.Shell"

function Get-Minutes
{
    try
    {
        [uint16]$userInput = Read-Host "Enter the number of minutes, or leave blank for default (60)"
    }
    catch [System.Management.Automation.RuntimeException]
    {
        Write-Host "Invalid Input. Please enter a number from 0 to 65535."
        Get-Minutes
    }

    return $userInput
}

$timerLength = Get-Minutes


###################################################################
######################### Shell Version ###########################
###################################################################

# $wshell.SendKeys("Timer Started~")

if ($timerLength -gt 0)
{
    for ($i = $timerLength; $i -gt 0; $i--)
    {
        $wshell.SendKeys("+")
        # $wshell.SendKeys("Minutes Remaining: $i~")
        Write-Output "Minutes Remaining: $i"
        Start-Sleep -Seconds 60
    }
    # $wshell.SendKeys("Time's Up!~")
    Write-Output "Time's Up!"
}
else 
{
    for ($i = 60; $i -gt 0; $i--)
    {
        $wshell.SendKeys("+")
        # $wshell.SendKeys("Minutes Remaining: $i~")
        Write-Output "Minutes Remaining: $i"
        Start-Sleep -Seconds 60
    }
    # $wshell.SendKeys("Time's Up!~")
    Write-Output "Time's Up!"
}

###################################################################
####################### End Shell Version #########################
###################################################################


###################################################################
######################## Notepad Version ##########################
###################################################################

# if (Test-Path ".\timer-log.txt")
# {
#     $app = Start-Process notepad ".\timer-log.txt" -PassThru
#     Start-Sleep -Seconds 1
# }
# else
# {
#     New-Item -Path . -Name "timer-log.txt" -ItemType "file"
#     $app = Start-Process notepad ".\timer-log.txt"
#     Start-Sleep -Seconds 1
# }

# $wshell.AppActivate($app.Id)
# Start-Sleep -Seconds 1
# $wshell.SendKeys("Timer Started~")

# if ($timerLength -gt 0)
# {
#     for ($i = $timerLength; $i -gt 0; $i--)
#     {
#         $wshell.AppActivate($app.Id)
#         Start-Sleep -Seconds 1
#         $wshell.SendKeys("Minutes Remaining: $i~")
#         Write-Output "Minutes Remaining: $i"
#         Start-Sleep -Seconds 59
#     }
#     $wshell.AppActivate($app.Id)
#     Start-Sleep -Seconds 1
#     $wshell.SendKeys("Time's Up!~")
#     Write-Output "Time's Up!"
# }
# else 
# {
#     $i = 0
#     while ($true)
#     {
#         $wshell.AppActivate($app.Id)
#         Start-Sleep -Seconds 1
#         $wshell.SendKeys("Minutes: $i~")
#         Write-Output "Minutes: $i" 
#         Start-Sleep -Seconds 59
#         $i++
#     }
# }

###################################################################
###################### End Notepad Version ########################
###################################################################
