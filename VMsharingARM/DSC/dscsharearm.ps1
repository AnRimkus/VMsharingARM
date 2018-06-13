Configuration main {
    
    param( 
      [string] $nodeName
	  #[string] $myprocess
	  )

Import-DscResource -ModuleName xPSDesiredStateConfiguration


Node $nodeName
  {
	  File CreateScriptsFolder {
        Type = 'Directory'
        DestinationPath = 'C:\Scriptsara'
        Ensure = "Present"
    }

	 xRemoteFile CopyContent {
            Uri = "https://vhdstorageakzwluladxnvm.blob.core.windows.net/task4filestocopy/Task1-1.ps1"
            DestinationPath = "C:\Scriptsara"
            MatchSource = $true
            
        }

		<#
      Script DownloadWebDeploy
    {
        TestScript = {
            Test-Path "C:\Install\npp.7.5.6.Installer.x64.exe"
        }
        SetScript ={
            $source = "https://vhdstorageakzwluladxnvm.blob.core.windows.net/task4filestocopy/npp.7.5.6.Installer.x64.exe"
            $dest = "C:\Install\npp.7.5.6.Installer.x64.exe"
            Invoke-WebRequest $source -OutFile $dest
        }
        GetScript = {@{Result = "DownloadWebDeploy"}}
        #DependsOn = "[WindowsFeature]WebServerRole"
    }
	#>
		
		Package InstallNPP
    {
        Ensure = "Present"  
        Path  = "C:\Install\npp.7.5.6.Installer.x64.exe"
        Name = "Notepad++ (64-bit x64)"
		ProductId = ''
		Arguments = "/S"
        #ProductId = "{ED4CC1E5-043E-4157-8452-B5E533FE2BA1}"
        #Arguments = "ADDLOCAL=ALL"
        #DependsOn = "[Script]DownloadWebDeploy"
    }

 }

}