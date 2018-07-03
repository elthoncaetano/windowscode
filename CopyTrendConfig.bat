@echo off

:: Parando o serviço OFFICESCAN
net stop "OfficeScan Active Directory Integration Service"
net stop "OfficeScan Master Service"

:: Criando a pasta com a data do dia
mkdir %date:/=%

:: Copiando arquivos necessários para a pasta "folder"
xcopy "C:\Program Files (x86)\Trend Micro\OfficeScan\PCCSRV\ofcscan.ini" "C:\RESTAURACAO_OFFICESCAN\PCCSRV_OFFLINE\%date:/=%"
xcopy "C:\Program Files (x86)\Trend Micro\OfficeScan\PCCSRV\Private\ofcserver.ini" "C:\RESTAURACAO_OFFICESCAN\PCCSRV_OFFLINE\%date:/=%"
xcopy "C:\Program Files (x86)\Trend Micro\OfficeScan\PCCSRV\ous.ini" "C:\RESTAURACAO_OFFICESCAN\PCCSRV_OFFLINE\%date:/=%"
xcopy "C:\Program Files (x86)\Trend Micro\OfficeScan\PCCSRV\Private\PFW" "C:\RESTAURACAO_OFFICESCAN\PCCSRV_OFFLINE\%date:/=%"
xcopy "C:\Program Files (x86)\Trend Micro\OfficeScan\PCCSRV\Private\SortingRuleStore\SortingRule.xml" "C:\RESTAURACAO_OFFICESCAN\PCCSRV_OFFLINE\%date:/=%"
xcopy "C:\Program Files (x86)\Trend Micro\OfficeScan\PCCSRV\Private\AuthorStore" "C:\RESTAURACAO_OFFICESCAN\PCCSRV_OFFLINE\%date:/=%"
xcopy "C:\Program Files (x86)\Trend Micro\OfficeScan\PCCSRV\Private\vdi.ini" "C:\RESTAURACAO_OFFICESCAN\PCCSRV_OFFLINE\%date:/=%"

:: Iniciando o serviço
net start "OfficeScan Master Service"