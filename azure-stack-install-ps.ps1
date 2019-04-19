Start-Process powershell -Verb runAs

Find-PackageProvider -Name 'Nuget' -ForceBootstrap -IncludeDependencies

Import-Module -Name PowerShellGet -ErrorAction Stop
Import-Module -Name PackageManagement -ErrorAction Stop
Get-PSRepository -Name "PSGallery"

Install-Module AzureRM -RequiredVersion 2.4.0 -Force
Install-Module -Name AzureStack -RequiredVersion 1.7.1 -Force

cd \
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
invoke-webrequest https://github.com/Azure/AzureStack-Tools/archive/master.zip -OutFile master.zip
expand-archive master.zip -DestinationPath . -Force
cd AzureStack-Tools-master