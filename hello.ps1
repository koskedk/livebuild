[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$Url = 'https://github.com/koskedk/hello/releases/download/v1.0/hello.zip'
$Destination= 'H:\DWAPI.Service_1_0_0_0\hello.zip'
$DestinationFolder= 'H:\DWAPI.Service_1_0_0_0\'

$client = new-object System.Net.WebClient
$client.DownloadFile($Url,$Destination)

Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

Unzip $Destination $DestinationFolder