$functions = @(Get-ChildItem -Path $PSScriptRoot\functions\*.ps1 -ErrorAction SilentlyContinue)
ForEach($function in $functions)
{
    . $function.FullName
}

Export-ModuleMember -Function *
