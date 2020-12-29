<h1 align="center">
  <img src="https://site.onitecnologia.com.br/wp-content/uploads/2020/02/logo-hd-1.png" />
</h1>

<h1 align="center">
  <img src="images/oni-logo.png" />
</h1>


## Pré Requisitos

- Ambiente PHP configurado [(Docker)](docs/DOCKER.md)
- Executar VPN (Em caso de acesso fora da rede interna) 

## Instalação

```
$ git clone usuario@10.62.0.2:/git/OniGestor giss
```

## Configurações do GIT
Execute os comandos de configuração dentro do diretorio do projeto. 

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