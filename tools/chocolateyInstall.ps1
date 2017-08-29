$ErrorActionPreference = 'Stop'
$packageName    = 'qdir'
$softwareName   = 'Q-Dir'
$installerType  = 'EXE'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url            = 'http://www.softwareok.com/Download/Q-Dir_Installer.zip'
$checksum       = 'F75CB399C32CE01F2415174891500FC9A5560358CBC36024B87CA04F5F9F15B3'
$url64          = 'http://www.softwareok.com/Download/Q-Dir_Installer_x64.zip'
$checksum64     = '0DAF9C136E5D25C8D913125BA803AC5CD3E2B87BAFC557EF930023DA21434AB0'
$silentArgs     = '/S'
$validExitCodes = @(0,1)
$bits = Get-ProcessorBits
 
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'ZIP'
  url            = $url
  checksum       = $checksum
  checksumType   = 'sha256'
  url64          = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha256' 
}
 
Install-ChocolateyZipPackage @packageArgs
 
if ($bits -eq 64)
   {
    $fileLocation = "$toolsDir\Q-Dir_Installer_x64.exe"
   } else {
    $fileLocation = "$toolsDir\Q-Dir_Installer_UC.exe"
   }
 
$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  file          = $fileLocation
  silentArgs    = $silentArgs
  validExitCodes= $validExitCodes
  softwareName  = $softwareName
}
  
Install-ChocolateyInstallPackage @packageArgs
   
Remove-Item $fileLocation | out-null





