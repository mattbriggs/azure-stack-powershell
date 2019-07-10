Start-Process powershell -Verb runAs

Find-PackageProvider -Name 'Nuget' -ForceBootstrap -IncludeDependencies

Import-Module -Name PowerShellGet -ErrorActiStop
Import-Module -Name PackageManagement -ErrorAction Stop
Get-PSRepository -Name "PSGallery"

Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted 
Install-Module -Name AzureRM.BootStrapper -Force

Get-AzureRMProfile -Update
Use-AzureRmProfile -Profile 2019-03-01-hybrid -Force
Install-Module -Name AzureStack -RequiredVersion 1.7.2

cd \
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
invoke-webrequest https://github.com/Azure/AzureStack-Tools/archive/master.zip -OutFile master.zip
expand-archive master.zip -DestinationPath . -Force
cd AzureStack-Tools-master