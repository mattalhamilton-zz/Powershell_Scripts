#Matt Hamilton
#Module 09 Homework


#These are my variables


$Soda_Price = 0
$Base_Price = 100
$AMTPaid = 0
$Refund = 0


$Soda_Ran = Get-Random -Minimum -3 -Maximum 4
$Soda_Ran = $Soda_Ran * 5
$Soda_Price = $Base_Price + $Soda_Ran
$Balance = $Soda_Price

Write-Host "Welcome to the Soda Machine! You may enter values of 5, 10 or 25 for payment`r`n"


#This while true section helps catch if the user inputed an actual soda, and didnt just press enter.

while ($true)
{
    clear
    $Soda = Read-Host "What type of soda would you like today?"

    if ($Soda -ne "")
    {
        Write-Host "The current price of $Soda is $Soda_Price`r`n"
        break
    }

    else
    {
        Write-Host "You must enter a value, press Enter to try again."
        Read-Host
        continue

    }
    
}


#This while section does the math and checking to see if the user input the correct amount, and refunds if they overpay.
#This section also checks to see if the user input one of the 3 allowable types of coins, nickels, dimes and quarters.

While ($true)
{

        if ($AMTPaid -eq $Soda_Price)
        {
            Write-Host "Enjoy your $Soda and have a wonderful day!"
            break            
        }



        if ($AMTPaid -gt $Soda_Price)
        {
            $Refund = $AMTPaid - $Soda_Price
            Write-Host "You have been refunded $Refund cents`r`n"
            Write-Host "Enjoy your $Soda and have a wonderful day!"
            break
        
        }
           
        $Coin = Read-Host "Please Enter a coin"

        try
        {
            $Coin -eq $Coin/1 | Out-Null
        }
        
        catch
        {
        
            Write-Host "That is not a valid amount."
            Write-Host "You still owe $Balance"
            Read-Host
            clear
            continue
        }
        


        if ($Coin -eq "")
        {
            clear
            Write-Host "That is not a valid amount."
            Write-Host "You still owe $Balance"
        }

        elseif ($Coin/1 -eq $Coin)
        {


            if ($Coin -eq 5)
            {
                clear
                Write-Host "You have entered a nickel."
                $AMTPaid = $AMTPaid + $Coin
                $Balance = $Soda_Price - $AMTPaid
                Write-Host "You still owe $Balance"
            }

            elseif ($Coin -eq 10)
            {
                clear
                Write-Host "You have entered a dime."
                $AMTPaid = $AMTPaid + $Coin
                $Balance = $Soda_Price - $AMTPaid
                Write-Host "You still owe $Balance"
            }

            elseif ($Coin -eq 25)
            {
                clear
                Write-Host "You have entered a quarter."
                $AMTPaid = $AMTPaid + $Coin
                $Balance = $Soda_Price - $AMTPaid
                Write-Host "You still owe $Balance"
            }

            else
            {
                clear
                Write-Host "That is not a valid amount."
                Write-Host "You still owe $Balance"
            }
        }


}

Read-Host "Press Enter to end the script."
