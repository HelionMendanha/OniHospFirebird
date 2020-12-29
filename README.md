<h1 align="center">
  <img src="images/oni-logo.png" />
</h1>

# Manual de Instalação OniHosp em Ambiente Linux

## Pré Requisitos
Este servidor deverá ser exclusivo para o banco de dados do sistema OniHosp, com intuito de melhor performance e também uma solução contra ameaças tais como ransomware. 
Lembramos que é responsabilidade do cliente os backups dos dados, sendo recomendamos copias em outros locais seguro.

## Versões homologada pela ONI
- Sistema operacional: CentOS 7.9 x86_64 [(CentOS 7.9 x86_64)](http://mirror.ci.ifes.edu.br/centos/7.9.2009/isos/x86_64/CentOS-7-x86_64-DVD-2009.iso)
- Banco de dados: firebird-classic-2.5

## Download da ISO
- A iso está disponível no site oficial do CentOS: [(CentOS 7 x86_64)](http://isoredirect.centos.org/centos/7/isos/x86_64/)

## Instalando SO CentOS 7.9
[(Instalando SO CentOS 7.9)](01INSTALLSO.md)



### Usuário
```
$ git config --local user.email usuario@onitecnologia.com.br
$ git config --local user.name "usuario"
```

### Mensagem padrão de commit
```
$ git config --local commit.template .gitmessage
```
___
# <img src="https://br.vuejs.org/images/logo.png" width="25"/> VUE.js


Para compilar o frontend do projeto:
```
$ cd frontend
$ npm update 
$ npm run build -- --dir=giss
```

---

## Git Flow
Utilize os utilitarios do [Git Flow]([https://link](https://www.atlassian.com/br/git/tutorials/comparing-workflows/gitflow-workflow)) para gerenciar seu fluxo de trabalho.

No diretorio do projeto digite:

```
$ git flow init
```

<br>
<h1 align="center">
  <img alt="Git Flow" src="https://wac-cdn.atlassian.com/dam/jcr:61ccc620-5249-4338-be66-94d563f2843c/05%20(2).svg?cdnVersion=1043" />
</h1>
<br>

1. Criar uma nova tarefa
```
 $ git flow feature start `numero_ticket`
```
2. Enviar o codigo para o repositorio remoto
```
 $ git push --set-upstream origin feature/`numero_ticket`
```
3. Finalizar tarefa após validação do QA
```
 $ git flow feature finish `numero_ticket`
```