param (
[string] $foldername,
[string] $servicenamecs1
) 

#mkdir c:\$foldername
mkdir c:\foldername2

if ((Get-Service -Name $servicenamecs1).status -eq "running"){ 
Stop-Service -Name $servicenamecs1
}

powershell.exe -ExecutionPolicy Bypass -File c:\Scriptsara\outfile.ps1 $foldername $servicenamecs1