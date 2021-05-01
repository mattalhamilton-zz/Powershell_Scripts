#Matt Hamilton
#PowerShell Project

$major_descriptors=@("BAD-TRAFFIC","DNS SPOOF","ET CURRENT_EVENTS","ET DNS","ET INFO","ET MALWARE","ET POLICY","ET TROJAN","ET WEB_CLIENT","ICMP","INFO","SCAN","WEB-IIS")

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

