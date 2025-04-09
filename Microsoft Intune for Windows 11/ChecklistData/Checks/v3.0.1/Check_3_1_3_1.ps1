$usersGuid = Get-Item -Path "Registry::HKEY_USERS" -ErrorAction SilentlyContinue | Get-ChildItem -ErrorAction SilentlyContinue | Where-Object { $_.Name -match "S-1-12-1" }

$isOK = $true

foreach ($user in $usersGuid) {
  $registryPath = "Registry::HKEY_USERS\$($user.Name)\Software\Policies\Microsoft\Windows\Control Panel\Desktop"
  $value = Get-ItemProperty -Path $registryPath -Name "ScreenSaveActive" -ErrorAction SilentlyContinue
  if ($value.ScreenSaveActive -ne 1) {
    $isOK = $false
  }
}

if($isOk -eq $false) {
  return $false
} else {
  return $true
}