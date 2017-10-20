# Global variable needed for mocking of $psISE variable for tests of Set-LocationToCurrentIseItem
[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSAvoidGlobalVars", "")]
param()

Describe 'posh-profile.psm1' {
    
    It "Can import module" {
        Import-Module (Join-Path (Split-Path $PSScriptRoot) 'posh-profile.psm1') -DisableNameChecking
    }

    It "Set-MsBuildExeVariablesForEnterpriseEdition has set variables" {
        $msBuildVS2015 | Should Not BeNullOrEmpty
        $msBuildVS2017 | Should Not BeNullOrEmpty
        $msBuildVS2017Preview | Should Not BeNullOrEmpty
    }

    It "'which' works with cmd" {
        which 'cmd' | Should Contain 'cmd.exe'
    }

    It 'Set-LocationToCurrentIseItem throws if not in ISE' {
        $global:psISE = $null
        { Set-LocationToCurrentIseItem } | Should throw
    }

    It "Set-LocationToCurrentIseItem works if ISE environment variable is set" {
        
        $initialLocation = Get-Location
        try {
            $tempFolder = [System.IO.Path]::GetTempPath()
            $global:psISE = @{CurrentFile=@{}}
            $global:psISE.CurrentFile.Add('FullPath',$tempFolder)
            Set-LocationToCurrentIseItem
            (Get-Location).Path | Should Be (Split-Path $tempFolder)
        }
        finally {
            Set-Location $initialLocation
        }
    }

    It "Set-MsBuildExeVariablesForEnterpriseEdition supports ShouldProcess" {
        Set-MsBuildExeVariablesForEnterpriseEdition -WhatIf
    }

    It "Set-MsBuildExeVariablesForEnterpriseEdition sets variables" {
        Set-MsBuildExeVariablesForEnterpriseEdition
        $msBuildVS2015        | Should Not BeNullOrEmpty
        $msBuildVS2017        | Should Not BeNullOrEmpty
        $msBuildVS2017Preview | Should Not BeNullOrEmpty
    }

    It "ShouldProcess for git helpers" {
        Update-GitSubmoduleRemote -WhatIf
        Update-GitSubmodule -WhatIf
        Update-GitRepo -WhatIf
        New-Feature 'myfeatureName' -WhatIf
        Update-BranchFromDevelop -WhatIf
    }

}

