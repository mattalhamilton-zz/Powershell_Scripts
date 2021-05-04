#Matt Hamilton
#PowerShell Project

global:$major_descriptors=@("BAD-TRAFFIC","DNS SPOOF","ET CURRENT_EVENTS","ET DNS","ET INFO","ET MALWARE","ET POLICY","ET TROJAN","ET WEB_CLIENT","ICMP","INFO","SCAN","WEB-IIS")

function func_1 ()
{
    Write-Host "Please be patient while the data is being parsed..."

    $file = ".\Hamilton\Matt\alert_full_short.pcap"
    
    Write-Output ("Date,Time,Priority,Classification,Description,Packet Type,Source IP,Source Port,Destination IP, Destination Port") | Out-File ".\Hamilton\Matt\alert_full_short_cleaned.csv" -encoding ascii
    $line_counter = 0

    foreach ($line in Get-Content $file)
    {
        if ($line.Contains("[**]"))
        {
            $line = $line.substring(0)
            $split1 = $line.Split("]")
            $description = $split1[2]
            $description = $description.Trim(" [**")

        }

        elseif ($line.Contains("Classification"))
        {
            $split2 = $line.substring(0)
            $split2 = $line.Split("]")
            $split2 = $split2[0]
            $split2 = $split2.Split(":")
            $classification = $split2[1]
            $split3 = $line.substring(0)
            $split3 = $line.Split("]")
            $split3 = $split3[1]
            $split3 = $split3.Split(":")
            $priority = $split3[1]
        
        }

        elseif ($line.Contains("->") -and $line.Contains("/"))
        {
            $split4 = $line.substring(0)
            $split4 = $line.Split("-")
            $date = $split4[0]
            $split5 = $line.substring(0)
            $split5 = $line.Split("-")
            $time = $split5[1].substring(0,5)
            $split6 = $line.substring(0)
            $split6 = $line.Split(":")
            $source_ip = $split6[2]
            $source_ip = $source_ip.Split(" ")[1]
            $split7 = $line.substring(0)
            $split7 = $line.Split(" ")
            $source_port = $split7[1].substring(0)
            $source_port = $source_port.Split(":")[1]
            $split8 = $line.substring(0)
            $split8 = $line.Split(" ")
            $split8 = $split8[3].substring(0)
            $destination_ip = $split8.Split(":")[0]
            $destination_port = $split8.Split(":")[1]




 
        }

        elseif ($line.Contains("DgmLen"))
        {
            $split9 = $line.substring(0)
            $packet_type = $line.Split(" ")[0]
            
        }

        elseif ($line.Length -eq 0)
        {
            Write-Output ($date + "," + $time + "," + $priority + "," + $classification + "," + $description + "," + $packet_type + "," + $source_ip + "," + $source_port + "," + $destination_ip + "," + $destination_port) | Out-File ".\Hamilton\Matt\alert_full_short_cleaned.csv" -Encoding ascii -Append
        }

        else
        {
            continue
        }




    }





}

function func_2 ()
{

    Write-Host "
Enter one or more starting characters for your major descriptor, or
Enter nothing to see all major descriptors, or
Enter 'exit' to return to the main menu:

"

$selection = Read-Host "Please enter your selection"

if ($selection.Length -eq 0)
{
    
    foreach ($i in global:$major_descriptors)
    {
        Write-Host "$i"
    }
}

if ($selection -eq "exit" -or "Exit")
{
    return
}


}

function func_3 ()
{

}

function func_4 ()
{

}

#name string
$MY_NAME = "Matt Hamilton"
$my_first_name = $MY_NAME.Split(" ")[0]
$my_last_name = $MY_NAME.Split(" ")[1]


#Setting the path to the users desktop
$user_path = "C:\Users\" + $env:UserName + "\Desktop"
Set-Location $user_path


#checking for active directory
if (-Not (Test-Path .\Hamilton))
{
    mkdir .\Hamilton\Matt | Out-Null
}

#Data file check
if (-Not (Test-Path .\alert_full_short.zip))
{
    Write-Host "Please add alert_full_short.zip to the desktop, and then restart the script."
    Read-Host "Press Enter to exit the script."
    break
}

#unzipping alert_full_short.zip into named subdirectory
Expand-Archive -Path .\alert_full_short.zip -DestinationPath .\Hamilton\Matt -Force


While ($true)
{

    clear


    Write-Host "
-----MAIN MENU-----
Please select from the following options:
1. Parse alert data
2. Major Descriptors
3. Classifications
4. Clean up and Exit
"

    $option = Read-Host -Prompt "Option# "

    if ($option -eq "1")
    {

        func_1
        continue
    }

    elseif ($option -eq "2")
    {
        func_2
        continue
    }

    elseif ($option -eq "3")
    {
        func_3
        continue
    }

    elseif ($option -eq "4")
    {
        func_4
        break
    }

    else
    {
        Read-Host "`r`nThat is not a valid option.  Please try again."
        continue
    }
}