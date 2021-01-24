#! /bin/bash

# Este shell script é para aprendizado

#-----------------------------------ENTRADA E SAÍDA DE ARGS
#Recebe três valores dados por quem irá executar o script 
echo "Você inseriu $1 $2 $3"

# Recebe todos os argumentos em uma array
args=("$@")
echo ${args[0]} ${args[1]} ${args[2]} ${args[3]}

# Conta a quantidade dos argumentos recebidos
echo "Quantidade de valores recebidos : $#"

#===========================================================

#Uso do comando read
echo "Por favor insira dois textos separados por espaços :"
read c d
echo "você inseriu : $c e $d"
#***
read -p  'Agora diretamente pelo read usando o parâmetro -p, digite dois numeros separados por espaços : 'a b
echo 'Seus numeros são : ' $a e $b
#***
read -sp 'Agora perguntando com segurança pelo read, me fale um segredo, se precisar de espaços use ""' secret
#***
read -ap 'Para finalizar, vamos usar uma array para guardar seus dados, digite três coisas separadas por espaço' array 
echo "$array[0], $array[1], $array[2]"

#-----------------------------------CONDICIONAIS
#if [ condicional ]
#then
#    declaração
# elif [ condicional ]
#then
#    declaração
#else
#    declaração
#fi

# COMPARAÇÃO DE INTEIROS
if [ "$a" -eq "$b" ]
then
    echo "condition is true"
else 
    echo "condition is false"
fi
# -eq - É igual a 

if [ "$a" -ne "$b" ]
then
    echo "condition is true"
else 
    echo "condition is false"
fi
# -ne - Não é igual a

if [ "$a" -gt "$b" ]
then
    echo "condition is true"
else 
    echo "condition is false"
fi
# -gt - É maior que

if [ "$a" -ge "$b" ]
then
    echo "condition is true"
else 
    echo "condition is false"
fi
# -ge - É maior ou igual a

if [ "$a" -lt "$b" ]
then
    echo "condition is true"
else 
    echo "condition is false"
fi
# -lt - É menor que

if [ "$a" -le "$b" ]
then
    echo "condition is true"
else 
    echo "condition is false"
fi
# -le - É menor ou igual a

#===========================================================

#COMPARAÇÃO DE STRINGS
if [ "$c" = "$d" ]
then
    echo "condition is true"
else 
    echo "condition is false"
fi
# = - é igual a

if [ "$c" == "$d" ]
then
    echo "condition is true"
else 
    echo "condition is false"
fi
# == - A MESMA COISA

if [ "$c" != "$d" ]
then
    echo "condition is true"
else 
    echo "condition is false"
fi
# != - não é igual a

if [[ "$c" > "$d" ]]
then
    echo "condition is true"
else 
    echo "condition is false"
fi
# < - é menos que, na ordem ASCII alfabético

if [[ "$c" < "$d" ]]
then
    echo "condition is true"
else 
    echo "condition is false"
fi
# > - -e maior que, na ordem ASCII alfabético

if [[ "$c" -z ]]
then
    echo "condition is true"
else 
    echo "condition is false"
fi
# -z -String é nula. isto é, o texto tem zero de tamanho

#-----------------------------------LAÇOS

#WHILE
#O laço mais facil de se trabalhar é o while, equanto. Ela segue a lógica de que enquanto uma expressão for verdadeira, continue executando essas linhas de código

#while [ condição ]
#do
#   comandos
#done

contador=1
#Enquanto contador for menor que 10
while [ $contador -le 10]
do
    echo $contador
    ((contador++))
done

#===========================================================

#LAÇO UNTIL
#O laço until, até, é bem similar ao while, enquanto, a diferença é que ele vai executar os comandos dentro dele até o teste se tornar verdadeiro

#until [ condição ]
#do
#   comandos
#done

$contador=1
#Até que contador seja maior que 10
until [ $contador -gt 10 ]
do
    echo $contador
    ((contador++))
done

#===========================================================

#LAÇO FOR 
#O laço for já é diferente dos outros dois, o que ele faz é para cada um dos itens dados pela lista, execute essa pilha de comandos. 

# for var in lista
#do
#   comandos
#done

itens='Ola tudo bem filho da puta de merda'
#Para cada item em itens, faça
for item in itens
do
    echo $item
done

#ALCANCES
#Podemos também usar no laço for algumas séries de numeros

for item in {1..5}
do
    echo $item 
done

# Quando especificamos um alcance, não pode haver espaços entre as chaves. Se você especificar o primeiro numero maior que o segundo o for apenas ira decrescer o valor. Se você definir um inicio e um fim, mas ainda precise que ele cresça ou diminua depois, apenas basta declarar com dois pontinhos

for item in {12..4..6}
do 
    echo $item
done

# Uma das aplicações mais usadas para o for é processando uma configuração de arquivos, para isto nós usamos "wildcards"(Uma série de blocos de construção para permitir a criação de um determinado padrão de arquivos ou diretórios. Sempre que nos referimos ao caminho podemos também usar wildcards no caminho para tornar um série de arquivos ou diretórios.). Vamos dizer que queremos converter uma série de .html's para .php.

# Criando os arquivos HTMLs
for htmls in {1..5}
do
    touch "$htmls.html"
done

# Fazendo a cópia em .php
for htmls in $1/*.html
do
    cp $htmls $1/$( basename -s .html $value ).php
done

#Quebra de Laços
# Para quebrar laços, utilizamos o BREAK, isso diz para o bash para sair do loop no momento. Talvez tenha uma situação comum que cause o loop a quebrar para finalizar, mas também tem aquele caso excepional em qu deveria acabar. Por exemplo, talvez estejamos copiando alguns arquivos mas o espaço em disco fica menor em certo nivel, nisso devemos parar de copiar.

for value in $1/*
do
    used=$( df $1 | tail -1 | awk '{ print $5 }'  | sed 's/%//' )
    if [ $used -gt 90 ]
    then 
        echo "Baixo espaço em disco 1>&2"
        break
    fi
    cp $value $1/backup/
done

#Continue
# Este diz para o bash para parar a repetição naquele momento e ir para a próximo, isto é, ele para o processo naquele ponto e vai para a proxima virada do loop.

for value in $1/*
do
    if [ ! -r $value]
    then 
        echo "$value não é legivel"
        continue
    fi
    cp $value $1/backup/
done

#===========================================================

# SELECT

# O mecanismo select permite a criação de um simples menu, seguindo este formato:

# select var in <list>
# do 
#   <commands>
# done 

# Quando invocado, ele ira pegar todos os itens da lista, assim como o for, e aprentá-lo na tela com um numero antes pra cada um deles. Uma nova tela de diálogo será mostrada permitindo o usuário selecionar um numero.  Quando eles selecionarem um numero e apertar a tecla enter o item correspondente será inserido na variavel var e os comandos entre o do e done serão rodados. QUando acabar ele ira imprimir o diálogo novamente para você selecionar outra opção.

objects='lixo, moeda, shurume, windows'
PS3='Select an object: '
select object in objects
do
    if [ $name == 'Quit']
    then
        break
    fi
    echo "Você pegou um(a)"
done

