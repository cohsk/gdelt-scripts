# a script to pull down gdelt data
# see gdeltproject.org for details
# .\getData.ps1 > output.txt 2>&1
Import-Module BitsTransfer
$masterFile = "masterfilelist.txt"
$webMasterFile = "http://data.gdeltproject.org/gdeltv2/masterfilelist.txt"
$output = ".\$masterFile"
$myLines = Get-Content -Path ".\$masterFile" | Measure-Object -Line
$totalLines = $myLines.Line
$sample = 4000
$startAt = $totalLines.Lines - $sample
cd ~\Downloads
Start-BitsTransfer -Source $webMasterFile -Destination $output
$lines = 0
foreach($line in Get-Content ".\$masterFile"){
  echo $line
  $lines = $lines + 1
  if ($lines -gt $startAt){
    $lineArray = $line.split(" ")
    $url = $lineArray[2]
    echo $url
    $myLineArray = $url.split("/")
    $output = $myLineArray[4]
    echo $output
    Start-BitsTransfer -Source $url -Destination "z:$output"
    $comp = (1 - (($totalLines - $lines)/$sample)) * 100
    Write-Progress -Id 1 -Activity Updating -Status 'Progress' -PercentComplete $comp -CurrentOperation Downloads
  }
}
echo $lines
