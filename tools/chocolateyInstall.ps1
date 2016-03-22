$packageName = 'qdir'
$installerType = 'exe'
$url = 'http://www.softwareok.com/Download/Q-Dir_Installer_Unicode.zip'
$silentArgs = '/S'

$chocTempDir = Join-Path $env:TEMP "chocolatey"
$tempDir = Join-Path $chocTempDir "$packageName"
$tempDir = Join-Path $tempDir "unzip"
if (![System.IO.Directory]::Exists($tempDir)) {[System.IO.Directory]::CreateDirectory($tempDir)}

Install-ChocolateyZipPackage "$packageName" "$url" "$tempDir"
$exeFilePath = get-childitem $tempDir -recurse -include *.$installerType | select -First 1
Install-ChocolateyInstallPackage "$packageName" "$installerType" "$silentArgs" "$exeFilePath"

Remove-Item "$tempDir" -Recurse









