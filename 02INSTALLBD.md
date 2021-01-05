<h1 align="center">
  <img src="images/oni-logo.png" />
</h1>

# Instalando e configurando serviços

Com sistema operacional instalado, inicialize um terminal de comandos através do próprio sistema operacional ou utilizando um cliente SSH e execute os comandos abaixo.

## Desativando SELINUX
```
sed -i 's/SELINUX=.*/SELINUX=disabled/' /etc/selinux/config
```

## Abrindo portas do Firewall (Firebird e Samba)
```
firewall-cmd --permanent --zone=public --add-service=samba
firewall-cmd --permanent --zone=public --add-port=3050/tcp
firewall-cmd --permanent --zone=public --add-port=3051/tcp
firewall-cmd --reload
```
## Verificando status, portas e serviços do Firewall
```
firewall-cmd --state
firewall-cmd --zone=public --permanent --list-ports
firewall-cmd --zone=public --permanent --list-services
```

## Adicionando repositório EPEL
```
yum install epel-release
```

> Reponda “y” ou “yes” para os questinamentos.

## Instalando serviços
```
yum install firebird-superclassic samba vim wget zip unzip tzdata ca-certificates
```

> Reponda “y” ou “yes” para os questinamentos.

## Ajustando a porta auxiliar do firebird (3050,3051)
```
sed -i 's/#RemoteServicePort = 3050/RemoteServicePort = 3050/' /etc/firebird/firebird.conf
sed -i 's/#RemoteAuxPort = 0/RemoteAuxPort = 3050/' /etc/firebird/firebird.conf
```

## Adicionando usuários (fbbackup,oni e oniadmin)
```
useradd -m fbbackup
usermod -g fbbackup -G firebird firebird
useradd -m oni
useradd -m oniadmin
```
## Criando diretórios e garantindo permissões
```
mkdir -p /firebirddatafiles
mkdir -p /firebirdbackup
mkdir -p /onihosp
chown -R oniadmin:oniadmin /onihosp
chown -R firebird:firebird /firebirddatafiles
chown -R firebird:firebird /firebirdbackup
```

## Alterando arquivos de configuração do Samba
Utilize o editor de texto para abrir o arquivo de configuração do Samba:
```
vim /etc/samba/smb.conf
```
Insira o texto abaixo ao final do arquivo ( /etc/samba/smb.conf ):

```
[fbdatafiles]
	comment = Datafiles
	path = /firebirddatafiles
	public = no
	writeable = yes
	create mode = 0777
	directory mode = 0777
	write list = firebird
	read list = firebird
	valid users = firebird

[fbbackups]
	comment = Backup
	path = /firebirdbackup
	public = no
	writeable = yes
	create mode = 0777
	directory mode = 0777
	write list = fbbackup
	read list = fbbackup
	valid users = fbbackup

[onihosp]
	comment = IniHosp Oni Tecnologia (62 3089 4900)
	path = /onihosp
	public = no
	writeable = yes
	create mode = 0755
	directory mode = 0755
	force directory mode = 0755
	force create mode = 0755
	write list = oniadmin
	read list = oni,oniadmin
	valid users = oni,oniadmin
```

## Adicionando usuário ao samba, ( compartilhamento de arquivo pela rede ) e definindo senha
```
smbpasswd -a fbbackup
```
> Usuário para o manipular os backups

```
smbpasswd -a oni
```
> Usuário para executar os executáveis do OniHosp

```
smbpasswd -a oniadmin
```
> Usuário para administrar os executáveis do OniHosp

## Redefinindo senha do usuário já adicionado
```
smbpasswd fbbackup
```
> Usuário para o manipular os backups

```
smbpasswd oni
```
> Usuário para executar os executáveis do OniHosp

```
smbpasswd oniadmin
```
> Usuário para administrar os executáveis do OniHosp

## Habilitando os serviços, (Firebird e Samba), para iniciar com o Boot da Máquina 
```
systemctl enable firebird-superclassic
systemctl enable smb
```

## Finalizando a configuração reinicie a máquina e cheque se os serviços iniciaram
Comando para reiniciar
```
reboot
```
___
## Comandos do firebird

### Iniciando o Firebird
```
systemctl start firebird-superclassic
```

### Reiniciando o Firebird
```
systemctl restart firebird-superclassic
```

### Verificando o status do Firebird
```
systemctl status firebird-superclassic
```
___
## Comandos do Samba

### Iniciando o Samba
```
systemctl start smb
```

### Reiniciando o Samba
```
systemctl restart smb
```

### Verificando o status do Samba
```
systemctl status smb
```
___
# Outros documentos
- [Download ISO](README.md)
- [Instalando SO](01INSTALLSO.md)
- [Instalando Serviços](02INSTALLBD.md)
- [Adicionando base de dados no servidor](03BASE.md)



