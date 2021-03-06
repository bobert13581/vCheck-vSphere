$Title = "Select Report Header Image"
$Header ="Select Report Header Image"
$Comments = "User selection of report header image"
$Display = "None"
$Author = "Phil Randal"
$PluginVersion = 1.1
$PluginCategory = "vCheck"

# Start of Settings
# Report Header Image Filename
$HeaderPicture="Insert your header here.png"
# End of Settings

# This plugin selects the report header image
# Expects to find specified Header Image in vCheck\Headers
# Reverts to default Header.jpg in vCheck Directory if file not found

#Changelog
## 1.0 : Quick and dirty hack - must be first plugin run

# $ScriptPath is set in vCheck.ps1, is the path to vCheck folder

$HeaderFile = $ScriptPath + "\Headers\" + $HeaderPicture
If (!(Test-Path $HeaderFile)) {
  $HeaderFile = $ScriptPath + "\Header.jpg"
}

# Create new Header Image

$HeaderImg = Get-Base64Image ($HeaderFile)

# overwrite $MyReport with header containing selected pic

$MyReport = Get-CustomHTML "$Server vCheck"
$MyReport += Get-CustomHeader0 ($Server)
