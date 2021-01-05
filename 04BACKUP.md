<h1 align="center">
  <img src="images/oni-logo.png" />
</h1>

# Adicionando script para backup da base de dados

Baixando script, ajustando caminho da base e agendando backup local
>Este script de backup fará backup automaticamente na própria máquina, orientar o cliente a fazer copias destes backups para outro local, pois em caso de perca do HD ou roubo da máquina não será possível a recuperação dos dados.

## Baixando o script de backup e configurando backup

1. Baixe o script de backup e ajuste sua permisão para poder executar
```
mkdir -p /opt/dba
wget https://raw.githubusercontent.com/HelionMendanha/OniHospFirebird/main/scriptBackupFirebird.sh -P /opt/dba
chmod +x /opt/dba/scriptBackupFirebird.sh
```

2. Edite o script de backup para ajusar o caminho da base.
```
vim /opt/dba/scriptBackupFirebird.sh
```

3. Ajuste o caminho da base conforme exemplo abaixo.
>base="/firebirddatafiles/BASE.FDB"

4. Execute o script manualmente para confirmar que o backup está sendo realizado
```
/opt/dba/scriptBackupFirebird.sh
```
>Após executar analise o log para se há mensagem de "Sucesso"

5. Adicione um agendamento via "crontab" para executar os backups automaticamente
Execute o comando abaixo para entrar no crontab
```
crontab -e
```
Adicione a linha abaixo para criar o agendamento
>20 3,12,20 * * * /opt/dba/scriptBackupFirebird.sh > /opt/dba/backup.log

___
# Outros documentos
- [Download ISO](README.md)
- [Instalando SO](01INSTALLSO.md)
- [Instalando Serviços](02INSTALLBD.md)
- [Adicionando base de dados no servidor](03BASE.md)
- [Backup do banco de dados](04BACKUP.md)



