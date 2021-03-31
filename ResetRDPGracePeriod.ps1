$ErrorActionPreference = "SilentlyContinue"
$definition = @"
using System;
using System.Runtime.InteropServices; 
namespace Win32Api
{
	public class NtDll
	{
		[DllImport("ntdll.dll", EntryPoint="RtlAdjustPrivilege")]
		public static extern int RtlAdjustPrivilege(ulong Privilege, bool Enable, bool CurrentThread, ref bool Enabled);
	}
}
"@ 


Add-Type -TypeDefinition $definition -PassThru
$bEnabled = $false
$res = [Win32Api.NtDll]::RtlAdjustPrivilege(9, $true, $false, [ref]$bEnabled)
$key = [Microsoft.Win32.Registry]::LocalMachine.OpenSubKey("SYSTEM\CurrentControlSet\Control\Terminal Server\RCM\GracePeriod", [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree,[System.Security.AccessControl.RegistryRights]::takeownership)
$acl = $key.GetAccessControl()
$acl.SetOwner([System.Security.Principal.NTAccount]"Administrators")
$key.SetAccessControl($acl)
$rule = New-Object System.Security.AccessControl.RegistryAccessRule ("Administrators","FullControl","Allow")
$acl.SetAccessRule($rule)
$key.SetAccessControl($acl)
Remove-Item 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\RCM\GracePeriod'
Start-Sleep -Seconds 5
Remove-Variable * -ErrorAction SilentlyContinue