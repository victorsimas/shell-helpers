#!/bin/bash

# Encontra todos os arquivos no diretório atual com a extensão shell, faz a listagem no xargs -I e define a lista com file, jogando na pasta $1 
find . -name "*.sh" | xargs -I file mv file $1
