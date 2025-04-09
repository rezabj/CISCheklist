<#
.SYNOPSIS
  Create CIS checklist for Windows 11 devices in Microsoft Intune.

.DESCRIPTION
  Create CIS checklist for Windows 11 devices in Microsoft Intune.
  This script automates the process of generating a checklist based on the CIS benchmarks for Windows 11.
  CIS Version: 3.0.1

.EXAMPLE
  Example of how to use the script.

.NOTES
  Author: Your Name
  Date: $(Get-Date -Format "yyyy-MM-dd")
  Version: 1.0
#>

[CmdletBinding()]
param (
  [Parameter(ParameterSetName='ConsoleOutput',Position=0,Mandatory=$true)]
  [switch]$ConsoleOutput,
  #Seve as file
  [Parameter(ParameterSetName='SeveAsFile',Position=1,Mandatory=$true)]
  [switch]$SaveAsFile,
  #Output file type
  [Parameter(ParameterSetName='SeveAsFile',Position=2,Mandatory=$true)]
  [ValidateSet("CSV", "JSON", "XML")]
  [string]$OutputType,
  #CheckList file path
  [Parameter(ParameterSetName='SeveAsFile',Position=3,Mandatory=$true)]
  [ValidateNotNullOrEmpty()]
  [string]$OutputPath
)


# Get CIS Automated checkers

$CSV = Import-Csv -Path ".\ChecklistData\Checks\CIS-3.0.1.csv" -Delimiter ';' -Encoding UTF8

foreach ($row in $CSV) {
  $script = Join-Path -Path $PSScriptRoot -ChildPath $row.Script
  $result = & $script
  if (!$OutputType) {
    $result = "$($row.ID),$($result)"
    $result
  }
}