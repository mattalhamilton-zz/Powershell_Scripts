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
    $line = $line.Substring(0)
    $split1 = $line.Substring(0)
    $split1 = $split1.Substring(0)
    $split1 = $split1.Split("[**]")
    $date_time = $split1.Substring(0)
    $date = $date_time.Substring(0)
    $date = $date[0].Substring(0,5)
    $time = $date_time[0].Substring(6,11)
    $split2 = $line.Substring(0)
    $split2 = $split2.Split("]")
    $split2 = $split2[2]
    $description = $split2.Trim(" [**")
    $split3 = $line.Substring(0)
    $split3 = $split3.Split("]")
    $classification = $split3[3]
    $classification = $classification.Trim("[Classification: ")
    $split4 = $line.Substring(0)
    $split4 = $split4.Split("[Priority: ")
    $Priority

    #$split4 = $split3.substring[1]
    #$split4 = $split4.split("] ")
    #$priority = $split4.substring[0]
    #$priority = $priority.substring[-1]
    #$split5 = $split4.substring[1].split("} ")
    #$ip_addresses = $split5.substring[1]
    #$ip_addresses = $ip_addresses.split[" -> "]
    #$source_ip = $ip_addresses.substring[0]
    #$destination_ip = $ip_addresses.substring[1]
    
    
    write-Host "$split4"
    #Write-Output ($date + "," + $time + "," + $priority + "," + $classification + "," + $description + "," + $source_ip + "," + $destination_ip) | Out-File alert_data.csv -Encoding ascii -Append
    #Write-Output $line_out | Out-File alert_data.csv -Encoding ascii -Append
}