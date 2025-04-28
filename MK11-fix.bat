(@echo off
chcp 1251 > nul
:: Удаляем  прошлую папку с сертификатами
powershell -WindowStyle Hidden Remove-Item -Path "$Env:TEMP\certs" -Recurse -Force 

:: Начало работы самих команд для решения проблем с MK11
powershell  md $Env:TEMP\certs
powershell  cd $Env:TEMP\certs
powershell  CertUtil -generateSSTFromWU $Env:TEMP\certs\RootStore.sst
powershell  $file=Get-ChildItem -Path $Env:TEMP\certs\Rootstore.sst
powershell  $file | Import-Certificate -CertStoreLocation Cert:\LocalMachine\Root
) > "log.txt"