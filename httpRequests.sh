#!/bin/bash

def=$1
url=$2
urlId=$3
jsonFile=$4

echo $def
echo $url
echo $urlId
echo $jsonFile

if [[ -z $1 ]]
then 
	echo "Você não inseriu o metodo para teste!"
elif [[ -z $2 ]]
then 
	echo "Você não inseriu a URL para teste"
elif [[  ! -z $3 ]] && [[ -z $4 ]]
then
	echo "Arquivo Json não inserido"
fi


if [[ -z $3 ]]
then
	if [ $def = 'GET' ]
	then
		lwp-request -m $def $url

	elif [ $def = 'POST' ]
	then
		echo $jsonFile | lwp-request -m $def -c "application/json" $url

	else

		echo "Nenhum método encontrado com a funcionalidade procurada"
	fi
else
	if [ $def = 'GET' ]
	then
		lwp-request -m $def "$url/$urlId"

	elif [ $def = 'PUT' ]
	then
		echo $jsonFile | lwp-request -m $def -c "application/json" "$url/$urlId"

	elif [ $def = 'DELETE' ]
	then
		lwp-request -m $def "$url/$urlId"

	else
		echo "O método é inválido para uso de modificação"
	fi
fi


