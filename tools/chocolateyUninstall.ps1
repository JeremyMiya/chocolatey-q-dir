$packageName = 'qdir'
$fileType = 'exe'
$silentArgs = '-uninstall'

$osBitness = Get-ProcessorBits
if ($osBitness -eq 64) {
    $programUninstallEntryName = "Q-Dir"
    $uninstallString = (Get-ItemProperty HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select DisplayName, UninstallString | Where-Object {$_.DisplayName -like "$programUninstallEntryName*"}).UninstallString
    $uninstallString = $uninstallString.Substring(0,39)
} else {
    $programUninstallEntryName = "Q-Dir"
    $uninstallString = (Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\* | Select DisplayName, UninstallString | Where-Object {$_.DisplayName -like "$programUninstallEntryName*"}).UninstallString
    $uninstallString = $uninstallString.Substring(0,33)
}
 
if ($uninstallString -ne "") {
	Uninstall-ChocolateyPackage $packageName $fileType $silentArgs $uninstallString
	$wshell = new-object -com wscript.shell
	Start-Sleep 1
	$wshell.sendkeys("`"OK`"~")
}





