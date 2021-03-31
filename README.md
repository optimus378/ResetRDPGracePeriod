# ResetRDPGracePeriod
Resets RDP Grace Period 

This is useful for Golden Images in Azure that stay in the Stopped state beyond the RDP Grace Period, preventing logging in. 
You can use this script via the serial console.  EX:

$global:ProgressPreference = "SilentlyContinue"
$script = Invoke-WebRequest 
Invoke-Expression $($script.Content)
