BeforeAll{
    $ModuleName = 'PHM-Utility'
}

Describe 'Module Manifest Tests' {
    It 'Passes Test-ModuleManifest' {
        $ModuleManifestName = "$ModuleName.psd1"
        Test-ModuleManifest -Path $ModuleManifestName | Should -Not -BeNullOrEmpty
        $? | Should -Be $true
    }
}
