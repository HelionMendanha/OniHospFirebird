#!/bin/bash

# Nome do cliente + _
cliente="MedCor_"
cliente="FB_"

# Após /firebirddatafiles/        
base="BASE.FDB"


# Script com padrao /firebirdbackup e /firebirddatafiles
# .............................................................
GBAK="/usr/bin/gbak -v -b -t -user SYSDBA -pas masterkey -y /opt/dba/export.log"
nw=$(date "+%Y_%m_%d_%Hh%Mm%Ss")
FBACKUP="/firebirdbackup/bkp$cliente$nw.fbk"
FBACKUPTGZ="$FBACKUP.tar.gz"

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

backup "$GBAK /firebirddatafiles/$base $FBACKUP"

if [ -f "$FBACKUP" ]
then
		backup "zip $FBACKUPTGZ $FBACKUP"
		backup "rm -rf $FBACKUP"
	else
		echo -e "\e[31m...............................\e[m"
		echo -e "\e[31m......Backup not found!........\e[m"
		echo -e "\e[31m...............................\e[m"
fi

# Remove backups antigos ====================================
echo ""
date
echo "find /firebirdbackup -type f -mtime +30 | xargs rm -f"
find /firebirdbackup -type f -mtime +30 | xargs rm -f

#  Cron 
# 20 3,12,20 * * * /opt/dba/scriptBackupFirebird.sh > /opt/dba/backup.log