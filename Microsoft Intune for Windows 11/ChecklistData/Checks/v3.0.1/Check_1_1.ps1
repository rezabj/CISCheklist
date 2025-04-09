$guid = Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\current\device\AboveLock\" -Name "AllowCortanaAboveLock_WinningProvider"
$value = Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\Providers\$($guid.AllowCortanaAboveLock_WinningProvider)\Default\Device\AboveLock" -Name "AllowCortanaAboveLock"

if($value -ne 0) {
  return $false
} else {
  return $true
}