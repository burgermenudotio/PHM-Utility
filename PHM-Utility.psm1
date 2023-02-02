Get-ChildItem -Path "$PSScriptRoot\functions\" -Filter *.ps1 -Recurse |
ForEach-Object
{
    . $_.FullName
}

Export-ModuleMember -Function *-*
