#Matt Hamilton
#PowerShell Project

$major_descriptors=@("BAD-TRAFFIC","DNS SPOOF","ET CURRENT_EVENTS","ET DNS","ET INFO","ET MALWARE","ET POLICY","ET TROJAN","ET WEB_CLIENT","ICMP","INFO","SCAN","WEB-IIS")

function func_1 ()
{
    Write-Output ("Date,Time,Priority,Classification,Description,Packet Type,Source IP,Source Port,Destination IP, Destination Port") | Out-File ".\Hamilton\Matt\alert_full_short_cleaned.csv" -encoding ascii

}

function func_2 ()
{

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
