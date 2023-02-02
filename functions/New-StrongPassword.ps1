function New-StrongPassword {
    [CmdletBinding()]
    param (
        # Password Length as integer
        [Parameter()]
        [ValidateRange(8,128)]
        [Int]
        $PasswordLength = 16
    )

    $availableCharacters = 48..126

    $password = ""

    for ($i = 0; $i -lt $PasswordLength; $i++) {
        $password += [char](Get-Random $availableCharacters)
    }

    $password
}