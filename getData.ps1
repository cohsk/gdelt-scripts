# a script to pull down gdelt data
# see gdeltproject.org for details
Import-Module BitsTransfer
$masterFile = "masterfilelist.txt"
$webMasterFile = "http://data.gdeltproject.org/gdeltv2/masterfilelist.txt"
$output = ".\$masterFile"
$startAt = 454650
cd ~\Downloads
Start-BitsTransfer -Source $webMasterFile -Destination $output
$lines = 0
foreach($line in Get-Content ".\$masterFile"){
  $lines = $lines + 1
  if ($lines -gt $startAt){
    $lineArray = $line.split(" ")
    $url = $lineArray[2]
    $myLineArray = $url.split("/")
    $output = $myLineArray[4]
    Start-BitsTransfer -Source $url -Destination ".\$output"
  }
}
echo $lines
