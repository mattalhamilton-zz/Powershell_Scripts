#Matt Hamilton
#Module 09 Homework

$Soda_Price = 0
$Base_Price = 100
$AMTPaid = 0
$Refund = 0

$Soda_Ran = Get-Random -Minimum -3 -Maximum 4
$Soda_Ran = $Soda_Ran * 5
$Soda_Price = $Base_Price + $Soda_Ran

Write-Host "Welcome to the Soda Machine! You may enter values of 5, 10 or 25 for payment`r`n"
$Soda = Read-Host "What type of soda would you like today?"



while ($true)
{

    try
    {
        $Soda -eq "" | Out-Null
    }
    catch
    {
        Write-Host "You must enter a value, press Enter to try again."
        continue
    }


    
        Write-Host "The current price of $Soda is $Soda_Price`r`n"
        break

    
}

While ($true)
{
        $Coin = Read-Host "Please Enter a coin"
        try
        {
            $Coin -eq $Coin/1 | Out-Null
        }

        catch
        {
                
            clear 
            Write-Host "That is not a valid amount."
            Write-Host "You still owe #Soda_Price"    
        }
           
        if (($AMTPaid -ge $Soda_Price))
        {
            $Refund = $AMTPaid - $Soda_Price
            Write-Host "You have been refunded $Refund cents`r`n"
            Write-Host "Enjoy your $Soda and have a wonderful day!"
            
        }

        elseif ($Coin -eq "")
        {
            clear
            Write-Host "That is not a valid amount."
            Write-Host "You still owe $Soda_Price"
        }

        elseif ($Coin/1 -is [int])
        {


            if ($Coin -eq 5)
            {
                clear
                Write-Host "You have entered a nickel."
                $AMTPaid = $AMTPaid + $Coin
            }

            elseif ($Coin -eq 10)
            {
                clear
                Write-Host "You have entered a dime."
                $AMTPaid = $AMTPaid + $Coin
            }

            elseif ($Coin -eq 25)
            {
                clear
                Write-Host "You have entered a quarter."
                $AMTPaid = $AMTPaid + $Coin
            }

            else
            {
                clear
                Write-Host "That is not a valid amount."
                Write-Host "You still owe #Soda_Price"
            }
        }

        else
        {
                clear
                Write-Host "That is not a valid amount."
                Write-Host "You still owe #Soda_Price"            
        }
}