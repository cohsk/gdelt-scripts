# a script to pull down gdelt data
# see gdeltproject.org for details
Import-Module BitsTransfer
$masterFile = "masterfilelist.txt"
$webMasterFile = "http://data.gdeltproject.org/gdeltv2/masterfilelist.txt"
$output = ".\$masterFile"
Start-BitsTransfer -Source $webMasterFile -Destination $output
$lines = 0
foreach($line in Get-Content ".\$masterFile"){
  $lines = $lines + 1
}
echo $lines
