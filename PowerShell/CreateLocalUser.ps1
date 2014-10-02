$Computer = [ADSI]"WinNT://$Env:COMPUTERNAME,Computer"

$LocalUser = $Computer.Create("User", "LocalUser")
$LocalUser.SetPassword("Password01")
$LocalUser.SetInfo()

$LocalUser.FullName = "Local User by Powershell"
$LocalUser.SetInfo()

$LocalUser.UserFlags = 64 + 65536 # ADS_UF_PASSWD_CANT_CHANGE + ADS_UF_DONT_EXPIRE_PASSWD
$LocalUser.SetInfo()
