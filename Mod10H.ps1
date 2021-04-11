#Matt Hamilton
#Mod 10 Homework



$spades = @(
'Ace of Spades', 'King of Spades',
'Queen of Spades', 'Jack of Spades',
'10 of Spades', '9 of Spades',
'8 of Spades', '7 of Spades',
'6 of Spades', '5 of Spades',
'4 of Spades', '3 of Spades',
'2 of Spades')

$diamonds = @(
'Ace of Diamonds', 'King of Diamonds',
'Queen of Diamonds', 'Jack of Diamonds',
'10 of Diamonds', '9 of Diamonds',
'8 of Diamonds', '7 of Diamonds',
'6 of Diamonds', '5 of Diamonds',
'4 of Diamonds', '3 of Diamonds',
'2 of Diamonds')

$clubs = @(
'Ace of Clubs', 'King of Clubs',
'Queen of Clubs', 'Jack of Clubs',
'10 of Clubs', '9 of Clubs',
'8 of Clubs', '7 of Clubs',
'6 of Clubs', '5 of Clubs',
'4 of Clubs', '3 of Clubs',
'2 of Clubs')


$hearts = @(
'Ace of Hearts', 'King of Hearts',
'Queen of Hearts', 'Jack of Hearts',
'10 of Hearts', '9 of Hearts',
'8 of Hearts', '7 of Hearts',
'6 of Hearts', '5 of Hearts',
'4 of Hearts', '3 of Hearts',
'2 of Hearts')



function newdeck_func()
{
    Write-Host "Im the new deck function"

}

function rmvcard_func()
{
    
}

function getcard_func()
{
    Write-Host "Im getting a card honestly bro"
}

newdeck_func









while ($true)
{
    clear
    Write-Host "
    Welcome to the card deck simulator.

    Please select from the following options:

        1. Draw a selected number of cards from the current deck
        2. Get a new deck of cards
        3. Exit

"
    $user_choice = Read-Host "Option#"


    if ($user_choice -eq 1)
    {
        clear
        getcard_func
        Read-Host -Prompt "Press Enter to return to the menu."
    }

    elseif ($user_choice -eq 2)
    {
        clear
        newdeck_func
        
    }
    
    elseif ($user_choice -eq 3)
    {
        clear
        break
    }
    
    else
    {
        clear
        Write-Host "That is not a valid input, press enter to return to the menu."
        Read-Host
        
    }
}
