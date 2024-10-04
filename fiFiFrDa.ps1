#Get the current Time
$nowTime = Get-Date

#Get all sub files
$allFile = ls . -Recurse -File


#Find all recent file
[int]$oldDay = Read-Host "type how old in days you want to find files"
#Create the old date
$oldTime = $nowTime.AddDays(-$oldDay)
#create an empty array of recent file
$recentFile = @()
#for each file check if it greater than oldtime
forEach($file in $allFile){
    $creationTime = $file.creationTime
    if($creationTime -gt $oldTime){
        $recentFile += $file
    }

}
#print the files
$recentFile | Select FullName,CreationTime