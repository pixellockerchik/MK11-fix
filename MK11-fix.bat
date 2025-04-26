@echo off

:: Проверка прав файла на права администратора
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Требуются права администратора! Запустите файл от имени админа.
    pause
    exit /b
)

:: Удаляем  прошлую папку с сертификатами
powershell Remove-Item -Path "$Env:TEMP\certs" -Recurse -Force 

:: Начало работы самих команд для решения проблем с MK11
powershell md $Env:TEMP\certs
powershell cd $Env:TEMP\certs
powershell CertUtil -generateSSTFromWU $Env:TEMP\certs\RootStore.sst
powershell $file=Get-ChildItem -Path $Env:TEMP\certs\Rootstore.sst
powershell $file | Import-Certificate -CertStoreLocation Cert:\LocalMachine\Root