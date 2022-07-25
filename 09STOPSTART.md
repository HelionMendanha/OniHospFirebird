<h1 align="center">
  <img src="images/oni-logo.png" />
</h1>

# Adicionando script de stop e start do firebird

Baixando script, ajustando caminho da base e agendando backup local
>Este script de backup fará backup automaticamente na própria máquina, orientar o cliente a fazer copias destes backups para outro local, pois em caso de perca do HD ou roubo da máquina não será possível a recuperação dos dados.

## Baixando o script de stop e start do firebird

1. Baixe o script de backup e ajuste sua permisão para poder executar
```
mkdir -p /opt/dba
wget https://raw.githubusercontent.com/HelionMendanha/OniHospFirebird/main/shFirebirdStopStart.sh -P /opt/dba
chmod +x /opt/dba/shFirebirdStopStart.sh
```

2. Adicione um agendamento via "crontab" para executar automaticamente, executando o comando abaixo para entrar no crontab
```
crontab -e
```
6. Adicione a linha abaixo para criar o agendamento e salve para sair (:wq!)
>20 2 * * * /opt/dba/shFirebirdStopStart.sh > /opt/dba/StopStart.log

___
# Outros documentos
- [Download ISO](README.md)
- [Instalando SO](01INSTALLSO.md)
- [Instalando Serviços](02INSTALLBD.md)
- [Adicionando base de dados no servidor](03BASE.md)
- [Backup do banco de dados](04BACKUP.md)
- [Restore de backup](05RESTORE.md)
- [Trocando de usuário de rede](06REDE.md)



