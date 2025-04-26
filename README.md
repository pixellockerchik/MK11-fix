Данный простенький файл автоматизирует вам ввод этих команд:
```
md $Env:TEMP\certs

cd $Env:TEMP\certs

CertUtil -generateSSTFromWU $Env:TEMP\certs\RootStore.sst

$file=Get-ChildItem -Path $Env:TEMP\certs\Rootstore.sst

$file | Import-Certificate -CertStoreLocation Cert:\LocalMachine\Root
```
