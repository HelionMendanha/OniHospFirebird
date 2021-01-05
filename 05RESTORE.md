<h1 align="center">
  <img src="images/oni-logo.png" />
</h1>

## Restaurando backup

1. Restaurando backup com gbak
```
/usr/bin/gbak -user SYSDBA -pas masterkey -g -c -z -v -r \
/firebirdbackup/bkpFB_2021_01_05_14h43m53s.fbk \
/firebirddatafiles/BASE_RETORE.FDB

```

2. Checando base com gfix
```
/usr/bin/gfix -user SYSDBA -pas masterkey -v -f /firebirddatafiles/BASE_RETORE.FDB
```
___
# Outros documentos
- [Download ISO](README.md)
- [Instalando SO](01INSTALLSO.md)
- [Instalando Serviços](02INSTALLBD.md)
- [Adicionando base de dados no servidor](03BASE.md)
- [Backup do banco de dados](04BACKUP.md)



