#Matt Hamilton
#Mod 12 Homework


clear
Write-Host "Processing the pcap file..."


#Setting path to the user desktop
$user_path = "c:\Users\" + $env:USERNAME + "\Desktop"
Set-Location $user_path

#writing the header of the csv file
Write-Output ("Date,Time,Priority,Classification,Description,Source IP, Destination IP") | out-File "alert_data.csv" -encoding ascii



#reading the pcap file

$file = ".\fast_short.pcap"
$data_line =  @()

foreach ($line in Get-Content $file)
{
    if ($line.ReadCount -eq 1)
    {
        continue
    }
    $split1 = $line.split("[**]")
    $date_time = $split1[0]
    $date = $date_time[0..5]
    $time = $date_time[6..11]
    $split2 = $split1[1]
    $split2 = $split2.split("]")
    $description = $split2[1]
    $split3 = $split2[2]
    $split3 = $split3.split("] [")
    $classification = $split3[0]
    $classification = $classification
    $classification = $classification[16..400]
    $split4 = $split3[1]
    $split4 = $split4.split("] ")
    $priority = $split4[0]
    $priority = $priority[-1]
    $split5 = $split4[1].split("} ")
    $ip_addresses = $split5[1]
    $ip_addresses = $ip_addresses.split[" -> "]
    $source_ip = $ip_addresses[0]
    $destination_ip = $ip_addresses[1]
    
    write-Host "$split2"
    write-Host "$date + "," + $time + "," + $priority + "," + $classification + "," + $description + "," + $source_ip + "," + $destination_ip"
    #Write-Output ($date + "," + $time + "," + $priority + "," + $classification + "," + $description + "," + $source_ip + "," + $destination_ip) | Out-File alert_data.csv -Encoding ascii -Append
    #Write-Output $line_out | Out-File alert_data.csv -Encoding ascii -Append
}