Configuration main {
    
    param( 
      [string] $nodeName
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

 }

}