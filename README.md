# Notification Bot Discord
Bot de notificação simples feito em shell script e discord.sh

A ideia desse script é fazer notificações para os usuários do discord utilizando-se de Webhook (criados para um canal do discord) baseando-se no cronograma definido no arquivo `cron`.

## Dependências
- ![Discord.sh](https://github.com/ChaoticWeg/discord.sh)

## Configuração
Dentro do arquivo `config`, você deve definir:
- ![Webhook](https://support.discord.com/hc/pt-br/articles/228383668-Usando-Webhooks)
- Nome do bot (Opcional)
- Imagem do bot (Opcional)

## Cronograma
Dentro do arquivo `cron` é definido os avisos que serão feitos.

Nele  é necessário inserir algumas informações na seguinte ordem:
```
Título da Notificação|Horário da Notificação|Dias da Semana|<@IDs das contas (Discord)>|Corpo da mensagem|URL da mensagem(Opcional)
```

Um exemplo seria:
```
Bom dia|09:00|seg ter qua qui sex|<@350812203865345678> <@350812203865329384>|Bom dia pessoal!|https://images.freeimages.com/images/large-previews/9c3/sunshine-1408040.jpg
```
Importante:
- Não deixe a linha comentada (começar com #)
- Apenas 1 horário por notificação.
- Usar sempre o formato de horário HH:MM
- Você pode marcar mais de um usuário e lembre-se de usar o seguinte formato <@ID>

Caso você não saiba como conseguir o ID de um usuário no discord clique ![aqui](https://support.discord.com/hc/pt-br/articles/206346498-Onde-posso-encontrar-minhas-IDs-de-Usu%C3%A1rio-Servidor-Mensagem-)

## Colocando para Funcionar!
Certifique-se que os arquivos estão todos no diretório:

```
$ ls
config  cron  discord.sh  notification.sh
```
Forneça permissão de execução para o `notification.sh`
```
chmod +x notification.sh
```
Rode  o script :)
```
./notification.sh
```
Exemplo de como fica a notificação:

<img src="https://i.imgur.com/Dj911WX.png">

## Contato
Caso você queira tirar alguma dúvida ou entrar em contato por algum outro motivo, fique a vontade de mandar mensagem no Discord
Tag: Mewbi#5028
