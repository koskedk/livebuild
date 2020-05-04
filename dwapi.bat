REM download dwapi.zip
""

REM extract dwapi.zip Copy dwapi H:\DWAPI.Service_1_0_0_0\dwapi
"H:\DWAPI.Service_1_0_0_0\"

REM Build
"C:\Program Files (x86)\Caphyon\Advanced Installer 15.3\bin\x86" AdvancedInstaller.com /build H:\Update\Dwapi_22_05_2019.aip

output
H:\Update\Dwapi_22_05_2019-SetupFiles\Dwapi_22_05_2019.exe


REM Create Update
"C:\Program Files (x86)\Caphyon\Advanced Installer 15.3\bin\x86" AdvancedInstaller.com /build H:\Update\Dwapi_22_05_2019.aip

H:\Update\Dwapi_22_05_2019-SetupFiles\updates