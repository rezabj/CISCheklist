$value = Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Personalization" -Name "NoLockScreenCamera" -ErrorAction SilentlyContinue

if($value.NoLockScreenCamera -ne 1) {
  return $false
} else {
  return $true
}