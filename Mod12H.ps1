#Matt Hamilton
#Mod 12 Homework


clear


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
    $date_time = $date_time[0].Split(".")
    $time = $date_time[0].Split(“-”, [System.StringSplitOptions]::RemoveEmptyEntries)
    $time = $time[1]
    $split2 = $line.Substring(0)
    $split2 = $split2.Split("]")
    $split2 = $split2[2]
    $description = $split2.Trim(" [**")
    $split3 = $line.Substring(0)
    $split3 = $split3.Split("]")
    $classification = $split3[3]
    $classification = $classification.Trim("[Classification: ")
    $split4 = $line.Substring(0)
    $split4 = $split4.Split("[")
    $split4 = $split4[5].Split("]")
    $priority = $split4[0].Trim("Priority: ")
    $split5 = $line.Substring(0)
    $split5 = $split5.Split("}")
    $ip_addresses = $split5[1]
    $source_ip = $ip_addresses.Split("-")
    $source_ip = $source_ip[0]
    $destination_ip = $ip_addresses.Split(">")
    $destination_ip = $destination_ip[1]


    
   #Writing the cut up line to the excel file on the desktop.
    Write-Output ($date + "," + $time + "," + $priority + "," + $classification + "," + $description + "," + $source_ip + "," + $destination_ip) | Out-File alert_data.csv -Encoding ascii -Append

}


Read-Host "Processing is done.  Press Enter to End the Script."