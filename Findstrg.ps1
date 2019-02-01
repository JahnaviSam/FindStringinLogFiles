$servers = GEt-Content -path C:\Users\jahnavi\Documents\servers1.txt
$strSearch = "PipeServerStopMessageReceived"
$outputFile = "C:\Users\jahnavi\Documents\out.csv"
 
$strTab = "`t"
foreach($server in $servers)
{
    $ServerPath = "\\$server\D$\data\logs\ltmbackend\"
    foreach ($file in Get-ChildItem $ServerPath)
    {
        #Write-host "Processing $File"
        foreach($line in Get-Content -Path $file.FullName)
            {
            if ([regex]::IsMatch($line, "$strSearch.*") -eq $true)
            { 
                #   write-host $line
                    "Found in file: $file.server $file.Name $strtab Statment: $line"  | Out-File $outputFile -append
            }
        }
    }    
}
