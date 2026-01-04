% Roleta
sugerir_aposta(roleta, vermelho) :-
    valor_esperado(roleta, vermelho, VE),
    VE > 0.

% Cara ou coroa
sugerir_aposta(cara_ou_coroa, cara) :-
    probabilidade(cara_ou_coroa, cara, P),
    P > 0.5.

% Futebol 2x1
sugerir_aposta(futebol, vitoria) :-
    probabilidade(futebol, vitoria, P),
    P > 0.6.
