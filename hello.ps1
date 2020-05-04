$Url = 'https://github.com/koskedk/hello/releases/download/v1.0/hello.zip'
$ZipFile = 'H:\DWAPI.Service_1_0_0_0\' + $(Split-Path -Path $Url -Leaf)
$Destination= 'H:\DWAPI.Service_1_0_0_0\'
 
Invoke-WebRequest -Uri $Url -OutFile $ZipFile
 
$ExtractShell = New-Object -ComObject Shell.Application
$Files = $ExtractShell.Namespace($ZipFile).Items()
$ExtractShell.NameSpace($Destination).CopyHere($Files)
Start-Process $Destination