# a script to pull down gdelt data
# see gdeltproject.org for details
$masterFile = "masterfilelist.txt"
$lines = 0
foreach($line in Get-Content ".\" & $masterFile){
  $lines = $lines + 1
}
echo $lines
