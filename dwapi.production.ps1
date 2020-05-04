[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$Url = 'https://github.com/koskedk/dwapi/releases/download/v2.4.x/dwapi.zip'
$Destination= 'H:\DWAPI.Service_1_0_0_0\dwapi.zip'
$DestinationFolder= 'H:\DWAPI.Service_1_0_0_0\'
$InstallerApp='C:\Program Files (x86)\Caphyon\Advanced Installer 15.3\bin\x86\advinst.exe'
$AppProj='/build H:\Update\Dwapi_22_05_2019.aip'
$AppExe='H:\Update\Dwapi_22_05_2019-SetupFiles\Dwapi_22_05_2019.exe'
$AppExePub='C:\Dot12\dwapi\client\downloads\dwapi.exe'

$client = new-object System.Net.WebClient
$client.DownloadFile($Url,$Destination)

Remove-Item -R 'H:\DWAPI.Service_1_0_0_0\dwapi' -Force

Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

Unzip $Destination $DestinationFolder

$Prms = $AppProj.Split(" ")
& "$InstallerApp" $Prms

Copy-Item $AppExe -Destination $AppExePub -Force