[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$Url = 'https://github.com/koskedk/hello/releases/download/v1.0/hello.zip'
$Destination= 'H:\DWAPI.Service_1_0_0_0\hello.zip'

$client = new-object System.Net.WebClient
$client.DownloadFile($Url,$Destination)