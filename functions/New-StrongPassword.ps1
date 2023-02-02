function New-StrongPassword {
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

    if(-not $ExcludeSpecialCharacters){
        $availableCharacters += 33..47 + 58..64 + 126
    }

    $password = ""

    for ($i = 0; $i -lt $PasswordLength; $i++) {
        $password += [char](Get-Random $availableCharacters)
    }

    $password
}