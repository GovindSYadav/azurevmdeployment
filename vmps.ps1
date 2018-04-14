$AzureSQLServerName = "gsydemo"
$AzureSQLDatabaseName = "demodb"
 
$AzureSQLServerName = $AzureSQLServerName + ".database.windows.net"
$Cred = Get-AutomationPSCredential -Name "sqldemodbcredentials"
$SQLOutput = $(Invoke-Sqlcmd -ServerInstance $AzureSQLServerName -Username $Cred.UserName -Password $Cred.GetNetworkCredential().Password -Database $AzureSQLDatabaseName -Query "exec [dbo].getNames" -QueryTimeout 65535 -ConnectionTimeout 60 -Verbose) 4>&1
 
Write-Output $SQLOutput

