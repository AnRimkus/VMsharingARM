param (
[string] $foldername,
[string] $servicenamecs1
) 

mkdir c:\$foldername
mkdir c:\foldername2

if ((Get-Service -Name Spooler).status -eq "running"){ 
Stop-Service -Name Spooler
}