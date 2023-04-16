#New max database size in GB:
$NewDBMaxSize = 2048

$DBGUIDs = Get-ExchangeServer $env:computername | Get-MailboxDatabase | select guid
foreach ($DBGUID in $DBGUIDs) {
 $RegPath = "HKLM:\SYSTEM\CurrentControlSet\Services\MSExchangeIS\"
 $DatabaseRegPath = "HKLM:\SYSTEM\CurrentControlSet\Services\MSExchangeIS\" + $env:computername + "\Private-" + $DBGUID.Guid
 New-ItemProperty -Path $DatabaseRegPath -Name "Database Size Limit in GB" -Value $NewDBMaxSize -PropertyType DWORD -Force | Out-Null
}