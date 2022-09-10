# Password Creation Script v1
# Created by Andrew Martin
# 04/28/2021

# Variables
$password = @()
$passwordEmpty = $false
$counter = 0
$condition = $true
$lowercase = 'abcdefghijklmnopqrstuvwxyz'
$uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
$numbers = '0123456789'
$symbols = '!"#$%&''()*+,-./:;<=>?@[\]^_`{|}~'

# Character arrays
$lowercaseArray = $lowercase.ToCharArray()
$uppercaseArray = $uppercase.ToCharArray()
$numbersArray = $numbers.ToCharArray()
$symbolsArray = $symbols.ToCharArray()
$arrayList = ($lowercaseArray,$uppercaseArray,$numbersArray,$symbolsArray)

# Main
# Intro to password creation tool
Write-Host "Welcome to the password creation tool" -ForegroundColor Green; Write-Host "- Created by Andrew Martin" -ForegroundColor Green

# Password length logic
# Password length input
Write-Host "Enter a length for your password:" -ForegroundColor Yellow
$passwordLength = Read-Host

# Checks if $passwordLength is blank or is an integer datatype
if ($passwordLength){
    # If $passwordLength is NOT blank proceed to integer check
    $passwordLength = [int]$passwordLength
    Write-Host "Null Check: Input is NOT null. Code will use [$passwordLength] as the password length. Proceeding." -ForegroundColor Green

    # Check to see if $passwordLength is an integer
    if ($passwordLength -is [int]){
        Write-Host "Integer Check: The input provided [$passwordLength] is an integer. Proceeding." -ForegroundColor Green
    }
    else {
        Write-Warning "Integer Check: The input provided [$passwordLength] is NOT an integer."
        Write-Host "Re-enter a length for your password as an integer:" -ForegroundColor Yellow
        $passwordLength = Read-Host
       
        if($passwordLength){
            $passwordLength = [int]$passwordLength
            # Last check before script exit of integer in $passwordLength
            if ($passwordLength -is [int]){
                Write-Host "Integer Check: The input provided [$passwordLength] is an integer. Proceeding." -ForegroundColor Green
            }
            else {
                Write-Warning "Program force exit. Reason: Input NOT integer."
                exit
            }
        }
        else{
            Write-Warning "Program force exit. Reason Input NULL."
            exit
        }
    }
}
else {
    # If $passwordLength IS blank proceed to ask for re-input
    Write-Warning -Message "No password length input."
    Write-Host "Previous input NULL. Re-enter a length for your password." -ForegroundColor Yellow
    $passwordLength = Read-Host
   
    # If $passwordLength is NOT blank proceed to integer check
    if ($passwordLength) {
        $passwordLength = [int]$passwordLength
        Write-Host "Null Check: Input is NOT null. Code will use [$passwordLength] as the password length. Proceeding." -ForegroundColor Green
       
        if($passwordLength -is [int]){
            Write-Host "Integer Check: The input provided [$passwordLength] is an integer. Proceeding." -ForegroundColor Green
        }
        else {
            Write-Warning "Integer Check: The input provided [$passwordLength] is NOT an integer."
            Write-Host "Re-enter a length for your password as an integer" -ForegroundColor Yellow
            $passwordLength = Read-Host
           
                if($passwordLength){
                $passwordLength = [int]$passwordLength
                # Last check before script exit of integer in $passwordLength
                if ($passwordLength -is [int]){
                    Write-Host "Integer Check: The input provided [$passwordLength] is an integer. Proceeding." -ForegroundColor Green
                }
                else {
                    Write-Warning "Program force exit. Reason: Input NOT integer."
                    exit
                }
            }
            else{
                Write-Warning "Program force exit. Reason Input NULL."
                exit
            }
        }
    }
    else {
      Write-Warning "Program force exit. Reason: Input NULL."
      exit  
    }
}

# Checks if $passwordLength is "0"
if ($passwordLength -eq 0){
    Write-Warning "Zero Check: The input value for password length [$passwordLength] is 0."
    Write-Host "Re-enter a length for your password that is NOT 0" -ForegroundColor Yellow
    $passwordLength = Read-Host
   
    if($passwordLength){
   
    $passwordLength = [int]$passwordLength
       
        if($passwordLength -is [int]){
          if($passwordLength -eq 0){
          Write-Warning "Program force exit. Reason: Input is 0."
          exit
          }
          else{
          Write-Host "Zero Check: The input value for password length [$passwordLength] is NOT 0. Proceeding." -ForegroundColor Green
          }
        }
        elseif(!($passwordLength -is [int])){
        Write-Warning "Program force exit. Reason: Input is NOT an integer."
        exit
        }
    }
    else{
    Write-Warning "Program force exit. Reason: Input is NULL."
    exit
    }
}
else{
    Write-Host "Zero Check: The input value for password length [$passwordLength] is NOT 0. Proceeding." -ForegroundColor Green
}

# Password rules:
# Special characters?
Write-Host "Do you want special characters included in your password?" -ForegroundColor Yellow

do{
$specialCharacterCheck = Read-Host "(y/n)"
}
while("y","n" -notcontains $specialCharacterCheck)

if($specialCharacterCheck -eq "y"){
    $condition = $true
}
elseif($specialCharacterCheck -eq "n"){
    $condition = $false
}

if($condition -eq $true){
    Write-Host "Special characters WILL be included in your password. Proceeding." -ForegroundColor Green
}
elseif($condition -eq $false){
    Write-Host "Special characters will NOT be included in your password. Proceeding." -ForegroundColor Green
    $arrayList = $arrayList -ne $symbolsArray
}

# Numbers?
Write-Host "Do you want numbers included in your password?" -ForegroundColor Yellow

do{
$numbersCheck = Read-Host "(y/n)"
}
while("y","n" -notcontains $numbersCheck)

if($numbersCheck -eq "y"){
    $condition = $true
}
elseif($numbersCheck -eq "n"){
    $condition = $false
}

if($condition -eq $true){
    Write-Host "Numbers WILL be included in your password. Proceeding." -ForegroundColor Green
}
elseif($condition -eq $false){
    Write-Host "Numbers will NOT be included in your password. Proceeding." -ForegroundColor Green
    $arrayList = $arrayList -ne $numbersArray
}

# Upper case characters?
Write-Host "Do you want upper case characters included in your password?" -ForegroundColor Yellow

do{
$upperCaseCheck = Read-Host "(y/n)"
}
while("y","n" -notcontains $upperCaseCheck)

if($upperCaseCheck -eq "y"){
    $condition = $true
}
elseif($upperCaseCheck -eq "n"){
    $condition = $false
}

if($condition -eq $true){
    Write-Host "Upper case characters WILL be included in your password. Proceeding." -ForegroundColor Green
}
elseif($condition -eq $false){
    Write-Host "Upper case characters will NOT be included in your password. Proceeding." -ForegroundColor Green
    $arrayList = $arrayList -ne $uppercaseArray
}

# Lower case characters?
Write-Host "Do you want lower case characters included in your password?" -ForegroundColor Yellow

do{
$lowerCaseCheck = Read-Host "(y/n)"
}
while("y","n" -notcontains $lowerCaseCheck)

if($lowerCaseCheck -eq "y"){
    $condition = $true
}
elseif($lowerCaseCheck -eq "n"){
    $condition = $false
}

if($condition -eq $true){
    Write-Host "Lower case characters WILL be included in your password. Proceeding." -ForegroundColor Green
}
elseif($condition -eq $false){
    Write-Host "Lower case characters will NOT be included in your password. Proceeding." -ForegroundColor Green
    $arrayList = $arrayList -ne $lowercaseArray
}

# Password creation loop
while($counter -le $passwordLength){
   
    $counter++

    if($arrayList -ne $null){
        $randomArray = Get-Random -InputObject $arrayList
        $randomElementOfRandomArray = $randomArray | Get-Random
        $password += $randomElementOfRandomArray
    }
    else{
        $passwordEmpty = $true
    }
}

# Output
if($passwordEmpty -eq $false){
    # Casting $password array to string
    $passwordString = [string]$password

    #Removing spaces from $passwordString
    $passwordString = $passwordString -replace ('\s','')

    Write-Host "Your newly generated password: " -NoNewline;Write-Host "$passwordString" -ForegroundColor Green
}
elseif($passwordEmpty -eq $true){
    Write-Warning "No options from parameters selected. Password NULL."
}