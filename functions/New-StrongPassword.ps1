function New-StrongPassword {

    <#
    .SYNOPSIS
        Generates a strong password.
    .DESCRIPTION
        Generates a strong password that includes uppercase, lowercase, numeric and special characters.
    .PARAMETER PasswordLength
        Accepts an integer as password length. Password length can be a minimum of 8 and maximum of 128. Default is 16.
    .PARAMETER ExcludeSpecialCharacters
        Switch to generate an exclusively alphanumeric password.
    .EXAMPLE
        New-StrongPassword

        pg,U+7JQ2Xx3;*t!

        New-StrongPassword -PasswordLength 24 -ExcludeSpecialCharacters

        pdMq4t226OnkITpvx1KLewFI
    #>

    [CmdletBinding()]
    param (
        # Password Length as integer
        [Parameter()]
        [ValidateRange(8,128)]
        [Int]
        $PasswordLength = 16,
        # Exclude special characters switch
        [Parameter()]
        [switch]
        $ExcludeSpecialCharacters
    )

    $availableCharacters = 48..57 + 65..90 + 97..122
    [regex]$validationRegex = '((?=.*\d)(?=.*[a-z])(?=.*[A-Z]).+)'

    if(-not $ExcludeSpecialCharacters){
        $availableCharacters += 33..47 + 58..64 + 126
        [regex]$validationRegex = '((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\W]).+)'
    }

    do {

        $password = ""

        for ($i = 0; $i -lt $PasswordLength; $i++) {

        $password += [char](Get-Random $availableCharacters)

        }

    } until (

        $validationRegex.IsMatch(($password))

    )

    $password

}