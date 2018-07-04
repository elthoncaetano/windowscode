Import-Module ActiveDirectory

#LIMPAR COMPUTADORES HABILITADOS PARA O USUÁRIO CORRENTE
Set-ADUser -Identity user1 -LogonWorkstations $Null
Set-ADUser -Identity user2 -LogonWorkstations $Null
Set-ADUser -Identity user3 -LogonWorkstations $Null

#LENDO O ARQUIVO.TXT E ADICIONANDO A UM ARRAY ($comparray)
#Preparar o TXT com um computador por linha e no máximo 80 Máquinas.
$complist = Get-Content -Path "C:\Scripts\ComputerLogon\PCList.txt"
foreach($comp in $complist){
     $comparray += "," + $comp
}

#ADICIONANDO OS COMPUTADORES AOS USUÁRIOS INSTALADOR, OFICIAL, DESINTALADOR
Set-ADUser -Identity user1 -LogonWorkstations $comparray
Set-ADUser -Identity user2 -LogonWorkstations $comparray
Set-ADUser -Identity user3 -LogonWorkstations $comparray

#LIMPANDO AS VARIAVEIS
$comparray = $Null
$complist = $Null