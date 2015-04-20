$hostName = "some.site.com"

# --------------------------------------------------------------------
# Create loopback exception
# --------------------------------------------------------------------
$hostNames = get-itemproperty HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0\ -Name BackConnectionHostNames
If ($hostNames -eq $null) { new-itemproperty HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0\ -Name BackConnectionHostNames -Value $hostName -PropertyType MultiString }
ElseIf (-not ($hostNames.BackConnectionHostNames -contains $hostName)) { set-itemproperty HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0\ -Name BackConnectionHostNames -Value ($hostNames.BackConnectionHostNames + $hostName) }
