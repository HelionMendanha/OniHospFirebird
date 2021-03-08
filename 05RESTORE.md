<h1 align="center">
  <img src="images/oni-logo.png" />
</h1>

## Restaurando backup em SO Windows

1. Encontre onde o gbak está instalado como nos exemplos abaixo
```
"C:\Program Files (x86)\Firebird\Firebird_2_5\bin\gbak.exe"
```

```
"C:\Program Files\Firebird\Firebird_2_5\bin\gbak.exe"
```

2. Restaurando backup com gbak (.fbk é o backup e .FDB será a base restaurada)
Ajustando o caminho do gbak, do backup  e onde será restaurado execute o comando conforme exemplo abaixo.
```
"C:\Program Files\Firebird\Firebird_2_5\bin\gbak.exe" -user "SYSDBA" -pas "masterkey" -g -c -z -v -r "C:\Users\helio\Downloads\BKP_ONI.fbk" "C:\Users\helio\Downloads\BASE_RETORE.FDB"
```

3. Checando a base com gfix
```
"C:\Program Files\Firebird\Firebird_2_5\bin\gfix.exe" -user SYSDBA -pas masterkey -v -f "C:\Users\helio\Downloads\BASE_RETORE.FDB"
```

4. Caso precise colocar a base Online
```
"C:\Program Files\Firebird\Firebird_2_5\bin\gfix.exe" -user "SYSDBA" -pas "masterkey" -online "C:\Users\helio\Downloads\BASE_RETORE.FDB"
```

## Restaurando backup em SO Linux

1. Restaurando backup com gbak (.fbk é o backup e .FDB será a base restaurada)
```
/usr/bin/gbak -user SYSDBA -pas masterkey -g -c -z -v -r \
/firebirdbackup/bkpFB_2021_01_05_14h43m53s.fbk \
/firebirddatafiles/BASE_RETORE.FDB

```

2. Checando a base com gfix
```
/usr/bin/gfix -user SYSDBA -pas masterkey -v -f /firebirddatafiles/BASE_RETORE.FDB
```

3. Caso precise colocar a base Online
```
/usr/bin/gfix -user SYSDBA -pas masterkey -online /firebirddatafiles/BASE_RETORE.FDB
```

___
# Outros documentos
- [Download ISO](README.md)
- [Instalando SO](01INSTALLSO.md)
- [Instalando Serviços](02INSTALLBD.md)
- [Adicionando base de dados no servidor](03BASE.md)
- [Backup do banco de dados](04BACKUP.md)



