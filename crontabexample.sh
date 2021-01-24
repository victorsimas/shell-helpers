#!/bin/bash
# para uso de entendimento de horario https://crontab.guru/
# estrutura:
#
#┌───────────── min (0 - 59)
#│ ┌────────────── hora (0 - 23)
#│ │ ┌─────────────── dia do mês (1 - 31)
#│ │ │ ┌──────────────── mês (1 - 12)
#│ │ │ │ ┌───────────────── dia da semana (0 - 6) (0 a 6 representa
#│ │ │ │ │                                   de domingo a sábado, ou use nomes;
#│ │ │ │ │                                    7 também representa domingo)
#│ │ │ │ │
#0 1 * * * /usr/local/cpanel/scripts/cpbackup
20 * * * * l -lah / >> ~/.textoOculto.txt 
