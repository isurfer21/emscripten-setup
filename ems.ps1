#!/usr/bin/env pwsh
$ems_bin_path = "${env:EMSDK}\upstream\emscripten"
$ems_self = $MyInvocation.MyCommand.Name
$ems_cmd = $args[0]
if ($args.Length -eq 0) {
  Write-Host "Usage: $ems_self executable [arguments]"
  exit 1
}
if (-not (Test-Path "$ems_bin_path\$ems_cmd.bat")) {
  Write-Host "Error: $ems_cmd is not a valid executable in $ems_bin_path"
  exit 2
}
$args = $args[1..($args.Length - 1)]
& "$ems_bin_path\$ems_cmd.bat" $args
