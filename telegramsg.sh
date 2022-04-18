#!/bin/bash

# Chat id to receive message - to get chat id: https://sean-bradley.medium.com/get-telegram-chat-id-80b575520659
GROUP_ID=<group_id>
# API Token to use bot, steps to create: https://core.telegram.org/bots
BOT_TOKEN=<bot_token>

# this 3 checks (if) are not necessary but should be convenient
if [ "$1" == "-h" ]; then
  echo "Modo de uso: `basename $0` \"text message\""
  exit 0
fi

if [ -z "$1" ]
  then
    echo "Adicione a mensagem como segundo argumento"
    exit 0
fi

if [ "$#" -ne 1 ]; then
    echo "Você pode informar apenas um argumento, para strings com espaco utilize aspas!"
    exit 0
fi

curl -d "text=$1&chat_id=$GROUP_ID" 'https://api.telegram.org/bot'$BOT_TOKEN'/sendMessage' > /dev/null