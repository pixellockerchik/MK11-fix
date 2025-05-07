import subprocess
fix_command = """
Remove-Item -Path "$Env:TEMP\certs" -Recurse -Force 
md $Env:TEMP\certs
cd $Env:TEMP\certs
CertUtil -generateSSTFromWU $Env:TEMP\certs\RootStore.sst
$file=Get-ChildItem -Path $Env:TEMP\certs\Rootstore.sst
$file | Import-Certificate -CertStoreLocation Cert:\LocalMachine\Root
clear
"""
subprocess.run(["powershell","-Command",fix_command])
print("Работа скрипта завершена, приятной игры)")
input("Нажмите Enter чтобы продолжить..")