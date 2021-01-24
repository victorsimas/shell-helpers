#! /bin/bash

# 1 - Criar uma variável, ${var} é o mesmo que $var, porém não ambíguo.
var="http://www.terminalroot.com.br/"
echo $var
http://www.terminalroot.com.br/

# 2 - Retornar o tamanho da string
echo ${#var}
31

# 3 - Executa o conteúdo de $var (igual ‘eval $$var’)
echo ${!var}

# 4 - Retorna os nomes de variáveis começadas por ‘U’
echo ${!U*}
UID USER USERNAME

# 5 - Retorna o texto a partir da posição 7
echo ${var:7}
www.terminalroot.com.br

# 6 - Retorna 8 caracteres a partir da posição 11
echo ${var:11:8}
terminal

# 7 - Corta ‘http://’ do início da string
echo ${var#http://}
www.terminalroot.com.br/

# 8 - Corta ‘.com.br/’ do final da string
echo ${var%.com.br/}
http://www.terminalroot

# 9 - Substitui ‘terminalroot’ por ‘aurelio’, uma vez
echo ${var/terminalroot/aurelio} 
http://www.aurelio.com.br/

# 10 - Substitui ‘o’ por ‘O’, sempre
echo ${var//o/O}
http://www.terminalrOOt.cOm.br/

# 11 - Se a string começar com ‘http’, substitui ‘http’ por ‘Site’
echo ${var/#http/Site}
Site://www.terminalroot.com.br/

# 12 - Se a string terminar com ‘te’, substitui ‘te’ por ‘TADO’
var2="teste"
echo ${var2/%te/TADO}
tesTADO

# 13 - “” (aspas duplas) protege uma string, mas reconhece $, \ e ` como especiais
echo "$var"
http://www.terminalroot.com.br/

# 14 - ‘’ (aspas simples) protege uma string, mas reconhece $, \ e ` como especiais
echo '$var'
$var

# 15 - $’…’ (cifrão antes de aspas simples) protege uma string completamente, mas interpreta \n, \t, \a, etc
echo $'$var\n'
$var

# 16 - ... (entre crases) Executa comandos numa subshell, retornando o resultado
echo `ls`
Área de trabalho Documentos Downloads Imagens Modelos Música Público Vídeos

# 17 - Executa comandos numa subshell
(ls)
Área de trabalho Documentos Downloads Imagens Modelos Música Público Vídeos

# 18 - Executa comandos numa subshell, retornando o resultado
echo $(ls)
Área de trabalho Documentos Downloads Imagens Modelos Música Público Vídeos

# 19 - Testa uma operação aritmética, retornando 0 ou 1
((11>9))

# 20 - Retorna o resultado de uma operação aritmética
echo $((11-9))
2

# 21 - Testa uma expressão, retornando 0 ou 1 (alias do comando ‘test’)
[ 5 -gt 3 ] && echo 'É maior!'
É maior!

# 22 - Testa uma expressão, retornando 0 ou 1 (podendo usar && e	 	)
[[ $var ]] && echo 'Existe essa variável'
Existe essa variável

# 23 - Variáveis especiais
# Variável |Parâmetros Posicionais
# $0	    Parâmetro número 0 (nome do comando ou função)
# $1	    Parâmetro número 1 (da linha de comando ou função)
# ...	    Parâmetro número N ...
# $9	    Parâmetro número 9 (da linha de comando ou função)
# ${10}	    Parâmetro número 10 (da linha de comando ou função)
# ...	    Parâmetro número NN ...
# $#	    Número total de parâmetros da linha de comando ou função
# $*	    Todos os parâmetros, como uma string única
# $@	    Todos os parâmetros, como várias strings protegidas
# Variável |Miscelânia
# $$	    Número PID do processo atual (do próprio script)
# $!	    Número PID do último job em segundo plano
# $_	    Último argumento do último comando executado
# $?	    Código de retorno do último comando executado

# 25 - Escapes especiais para usar no prompt (PS1)
# Escape	Lembrete	    Expande para...
# \a	    Alerta	        Alerta (bipe)
# \d	    Data	        Data no formato "Dia-da-semana Mês Dia" (Sat Jan 15)
# \e	    Escape	        Caractere Esc
# \h	    Hostname	    Nome da máquina sem o domínio (dhcp11)
# \H	    Hostname	    Nome completo da máquina (dhcp11.empresa)
# \j	    Jobs	        Número de jobs ativos
# \l	    Tty	            Nome do terminal corrente (ttyp1)
# \n	    Newline	        Linha nova
# \r	    Return	        Retorno de carro
# \s	    Shell	        Nome do shell (basename $0)
# \t	    Time	        Horário no formato 24 horas HH:MM:SS
# \T	    Time	        Horário no formato 12 horas HH:MM:SS
# \@	    At	            Horário no formato 12 horas HH:MM am/pm
# \A	    At	            Horário no formato 24 horas HH:MM
# \u	    Usuário	        Login do usuário corrente
# \v	    Versão	        Versão do Bash (2.00)
# \V	    Versão	        Versão+subversão do Bash (2.00.0)
# \w	    Working Dir	    Diretório corrente, caminho completo ($PWD)
# \W	    Working Dir	    Diretório corrente, somente o último (basename $PWD)
# \!	    Histórico	    Número do comando corrente no histórico
# \#	    Número	        Número do comando corrente
# \$	    ID	            Mostra "#" se for root, "$" se for usuário normal
# \nnn	    Octal	        Caractere cujo octal é nnn
# \\	    Backslash	    Barra invertida \ literal
# \[	    Escapes	        Inicia uma seqüência de escapes (tipo códigos de cores)
# \]	    Escapes	        Termina uma seqüência de escapes

# 26 - Escapes reconhecidos pelo comando echo
# Escape	Lembrete	Descrição
# \a	    Alerta	    Alerta (bipe)
# \b	    Backspace	Caractere Backspace
# \c	    EOS	        Termina a string
# \e	    Escape	    Caractere Esc
# \f	    Form feed	Alimentação
# \n	    Newline	    Linha nova
# \r	    Return	    Retorno de carro
# \t	    Tab	        Tabulação horizontal
# \v	    Vtab	    Tabulação vertical
# \\	    Backslash	Barra invertida \ literal
# \nnn	    Octal	    Caractere cujo octal é nnn
# \xnn	    Hexa	    Caractere cujo hexadecimal é nn

# 27 - Formatadores do comando date
# Formato	Descrição
# %a	    Nome do dia da semana abreviado (Dom..Sáb)
# %A	    Nome do dia da semana (Domingo..Sábado)
# %b	    Nome do mês abreviado (Jan..Dez)
# %B	    Nome do mês (Janeiro..Dezembro)
# %c	    Data completa (Sat Nov 04 12:02:33 EST 1989)
# %y	    Ano (dois dígitos)
# %Y	    Ano (quatro dígitos)
# %m	    Mês (01..12)
# %d	    Dia (01..31)
# %j	    Dia do ano (001..366)
# %H	    Horas (00..23)
# %M	    Minutos (00..59)
# %S	    Segundos (00..60)
# %s	    Segundos desde 1º de Janeiro de 1970
# %%	    Um % literal
# %t	    Um TAB
# %n	    Uma quebra de linha

# 28 - Formatadores do comando printf
# Formato	Descrição
# %d	Número decimal
# %o	Número octal
# %x	Número hexadecimal (a-f)
# %X	Número hexadecimal (A-F)
# %f	Número com ponto flutuante
# %e	Número em notação científica (e+1)
# %E	Número em notação científica (E+1)
# %s	String

# 29 - Para saber todas as variáveis locais, execute
set
# ou, e abra o txt para ver depois
set > VariaveisLocais.txt

# 30 - Variáveis globais, para saber todas as variáveis globais, execute
env
# ou
printenv

# 31 - Para atribuir um valor a uma variável local
LINUX=free
echo $LINUX
free 

# 32 - verificar se a variável criada no item anterior aparece na relação de variáveis locais
set | grep LINUX
LINUX=free 

# 33 - Agora vamos tornar esta variável local em uma variável global
export LINUX
env | grep LINUX
LINUX=free

# 34 - Deletar uma ‘variável de ambiente local’ da memória usamos o comando unset
unset LINUX
echo $LINUX

# 35 - Criar um aliases ( apelido para um comando ou programa ), você ainda pode incluí-lo no seu ~/.bashrc
alias listar='ls -la color=auto'

# 36 - Destruir um aliase
unalias listar

# 37 - Verificar todos os comando digitados
history
# executar o comando pelo número dele no history
!468
# executar o último comando digitado
!!
# eles ficam no bash_history
cat bash_history
# limpar o history
history -c

# 38 - Interpretadores de linha de comando

# $ - Shell de um usuário comum;

# - Shell do superusuário root (administrador)
# Verificar dos os Shells disponíveis

cat /etc/shells
# Variável que mostra o SHELL que você utiliza
echo $SHELL

# 39 - Criando um Array (Arranjo) “conjunto de variáveis”
DISTROS=( "Debian" "Trisquel" "Ubuntu" "RedHat")
# Se você imprimir o Array DISTROS como variável, ele printará a variável 0 , o array exibe as variáveis nele contidas começando do 0 (zero), logo seria o mesmo de imprimir a ${DISTROS[0]}
echo $DISTROS

# 40 - Imprimir o elemento 1 da array DISTROS
echo ${DISTROS[1]}
Trisquel

# 41 - Pode-se também criar um array inserindo elemento um de cada vez
DISTROS[0]="Debian"
DISTROS[1]="Trisquel"
DISTROS[2]="Ubuntu"
DISTROS[3]="RedHat"

# 42 - Alterar o elemento 2 do array DISTROS
DISTROS[2]="Linux Mint"

echo ${DISTROS[2]}
Linux Mint
# 43 - Exibir Distro do elemento 2 até o final
echo ${DISTROS[@]:2} 
Ubuntu RedHat

# 44 - Esta exibe os elementos com início na posição 1 seguidos de mais dois elementos consecutivos à posição 1
echo ${DISTROS[@]:1:2} 
Trisquel Ubuntu

# 45 - Saber quantos elementos possui o array DISTROS
echo ${#DISTROS[@]} 

# 46 - Andar por cada elemento da array
echo ${!DISTROS[@]}