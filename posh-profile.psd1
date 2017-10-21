#
# Module manifest for module 'posh-profile'
#
 
@{
 
# Script module or binary module file associated with this manifest
RootModule = 'posh-profile.psm1'
 
# Version number of this module.
ModuleVersion = '1.0'
 
# ID used to uniquely identify this module
GUID = '6b3bd6b6-a4c0-45e6-a023-72ddda10c1f4'
 
# Author of this module
Author = 'Christoph Bergmeister'
 
# Company or vendor of this module
CompanyName = 'Unknown'
 
# Copyright statement for this module
Copyright = '(c) 2017 Christoph Bergmeister. All rights reserved.'
 
# Description of the functionality provided by this module
Description = 'A collection of useful helpers especially for the PowerShell profile.'
 
# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = ''
 
# Name of the Windows PowerShell host required by this module
PowerShellHostName = ''
 
# Minimum version of the Windows PowerShell host required by this module
PowerShellHostVersion = ''
 
# Minimum version of the .NET Framework required by this module
DotNetFrameworkVersion = ''
 
# Minimum version of the common language runtime (CLR) required by this module
CLRVersion = ''
 
# Processor architecture (None, X86, Amd64, IA64) required by this module
ProcessorArchitecture = ''
 
# Modules that must be imported into the global environment prior to importing this module
RequiredModules = @('Jump.Location', 'posh-docker', 'posh-with', 'PoShFuck',
                    "$PSScriptRoot\source\macAddressUtils\macAddressUtils.psd1",
                    '.\source\dotnetCli\dotnetCli.psd1',
                    '.\source\gitUtils\gitUtils.psd1')
 
# Assemblies that must be loaded prior to importing this module
RequiredAssemblies = @()
 
# Script files (.ps1) that are run in the caller's environment prior to importing this module
ScriptsToProcess = @('.\poshprofileAliases.ps1', '.\poshProfileVariables.ps1')
 
# Type files (.ps1xml) to be loaded when importing this module
TypesToProcess = @()
 
# Format files (.ps1xml) to be loaded when importing this module
FormatsToProcess = @()
 
# Modules to import as nested modules of the module specified in ModuleToProcess
NestedModules = @()
 
# Functions to export from this module
#FunctionsToExport = '*'
 
# Cmdlets to export from this module
#CmdletsToExport = '*'
 
# Variables to export from this module
VariablesToExport = @($msBuildVS2015, $msBuildVS2017, $msBuildVS2017Preview)
 
# Aliases to export from this module
#AliasesToExport = '*'
 
# List of all modules packaged with this module
ModuleList = @()
 
# List of all files packaged with this module
FileList = @()
 
# Private data to pass to the module specified in ModuleToProcess
PrivateData = ''
 
}