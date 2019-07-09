# a script to pull down gdelt data
# see gdeltproject.org for details
$lines = 0
foreach($line in Get-Content .\masterfilelist.txt){
  $lines = $lines + 1
}
echo $lines
