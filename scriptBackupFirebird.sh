#!/bin/bash

# Caminho da base no Disco  
base="/firebirddatafiles/BASE.FDB"

# Nome do cliente + _
cliente="FB_"


# Script com padrao /firebirdbackup
# .............................................................
GBAK="/usr/bin/gbak -v -b -t -user SYSDBA -pas masterkey -y /opt/dba/export.log"
nw=$(date "+%Y_%m_%d_%Hh%Mm%Ss")
FBACKUP="/firebirdbackup/bkp$cliente$nw.fbk"
FBACKUPTGZ="$FBACKUP.tar.gz"

if [ -f "$base" ]; then
	echo -e "\e[32m$base OK\e[m"
	du -hs $base
	echo ""
else
	echo -e "\e[31mFile not found: $base\e[m"
	echo -e "\e[31mArquivo de informado de base para backup não existe\e[m"
	exit 0
fi

if [ -d "/firebirdbackup" ]; then
	echo -e "\e[32m/firebirdbackup OK\e[m"
	du -hs /firebirdbackup
	echo ""
else
	echo -e "\e[31mFolder not found: $base\e[m"
	echo -e "\e[31mDiretório para armazenamento de backup não existe\e[m"
	exit 0
fi

function backup()
{
	date
	echo -e "\e[32mInicio.....................\e[m"
	echo "$1"
	$1
	date
	echo -e "\e[31m.........................Fim\e[m"
	echo ""
}

rm -rf /opt/dba/export.log

echo -e "\e[33m..................................\e[m"
echo -e "\e[33m. Backup $cliente $nw.............\e[m"
echo -e "\e[33m..................................\e[m"
echo ""

backup "$GBAK $base $FBACKUP"

if [ -f "$FBACKUP" ]
then
		backup "tar -zcvf $FBACKUPTGZ $FBACKUP"
		backup "rm -rf $FBACKUP"
	else
		echo -e "\e[31m...............................\e[m"
		echo -e "\e[31m......Backup not found!........\e[m"
		echo -e "\e[31m...............................\e[m"
		exit 0
fi

# Remove backups antigos ====================================
echo ""
date
echo "Removendo backups antigos"
echo "find /firebirdbackup -type f -mtime +30 | xargs rm -f"
find /firebirdbackup -type f -mtime +30 | xargs rm -f

echo ""
echo ""
echo -e "\e[32m$FBACKUPTGZ OK\e[m"
du -hs $FBACKUPTGZ
echo ""
echo -e "\e[32mSucesso\e[m"
echo ""

#  Cron 
# 20 3,12,20 * * * /opt/dba/scriptBackupFirebird.sh > /opt/dba/backup.log

