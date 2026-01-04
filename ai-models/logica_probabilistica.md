# Lógica Probabilística

## Visão Geral
A Lógica Probabilística estende a lógica clássica ao permitir que fatos e
regras possuam graus de probabilidade associados.

## Conhecimento Incerto
Essa abordagem possibilita inferência lógica mesmo quando o conhecimento
não é absoluto.

## Aplicação na Plataforma ApostaIA
Na ApostaIA, a lógica probabilística é utilizada no motor de decisão,
modelado conceitualmente em Prolog, para sugerir apostas com base em
limiares probabilísticos.

## Exemplo em Prolog
```prolog
probabilidade(vitoria, 0.65).
apostar :- probabilidade(vitoria, P), P > 0.6.
