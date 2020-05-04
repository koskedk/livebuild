[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$Url = 'https://github.com/koskedk/hello/releases/download/v1.0/hello.zip'
$Destination= 'H:\DWAPI.Service_1_0_0_0\hello.zip'
$DestinationFolder= 'H:\DWAPI.Service_1_0_0_0\'
$InstallerApp='C:\Program Files (x86)\Caphyon\Advanced Installer 15.3\bin\x86\advinst.exe'
$AppProj='/build H:\Update\Dwapi_22_05_2019.aip'

$client = new-object System.Net.WebClient
$client.DownloadFile($Url,$Destination)

Remove-Item -R 'H:\DWAPI.Service_1_0_0_0\hello' -Force

Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

Unzip $Destination $DestinationFolder

$Parms = "/COMPONENTS CONTROLLER,DESKTOPSTUDIO,DESKTOPDIRECTOR,LICENSESERVER,STOREFRONT /PASSIVE /NOREBOOT /CONFIGURE_FIREWALL /NOSQL"

$Prms = $AppProj.Split(" ")
& "$InstallerApp" $Prms
