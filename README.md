# ResetRDPGracePeriod
Resets RDP Grace Period 

This is useful for Golden Images in Azure that stay in the Stopped state beyond the RDP Grace Period, preventing logging in. 
You can use this script via the serial console.  EX:

$global:ProgressPreference = "SilentlyContinue"

$script = Invoke-WebRequest https://raw.githubusercontent.com/optimus378/ResetRDPGracePeriod/main/ResetRDPGracePeriod.ps1

Invoke-Expression $($script.Content)

Use at your own Risk. Not responsible for misuse. 
Script modified from here: https://github.com/Prakash82x/PowerShell/tree/master/TerminalService
