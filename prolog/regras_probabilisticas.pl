% ======================================
% ApostaIA - Simulador de Apostas em Prolog
% Jogos: Roleta, Cara ou Coroa, Futebol 2x1
% ======================================

% -----------------------------
% JOGO 1: ROLETAS
% -----------------------------
% Probabilidades simples para cores
probabilidade(roleta, vermelho, 18/37).   % 18/37 chance de vermelho
probabilidade(roleta, preto, 18/37).      % 18/37 chance de preto
probabilidade(roleta, verde, 1/37).       % 1/37 chance de zero

% Regras para sugerir aposta baseada em valor esperado
sugerir_aposta(roleta, Cor) :-
    probabilidade(roleta, Cor, P),
    valor_esperado(roleta, Cor, VE),
    VE > 0,
    format('Aposta sugerida em ~w com VE=~2f e probabilidade ~2f~n', [Cor, VE, P]).

% Valor esperado (simplificado)
valor_esperado(roleta, Cor, VE) :-
    probabilidade(roleta, Cor, P),
    VE is P*2 - 1.  % pagamento 2x da aposta, simplificação

% -----------------------------
% JOGO 2: CARA OU COROA
% -----------------------------
probabilidade(cara_ou_coroa, cara, 0.5).
probabilidade(cara_ou_coroa, coroa, 0.5).

sugerir_aposta(cara_ou_coroa, cara) :-
    probabilidade(cara_ou_coroa, cara, P),
    P >= 0.5,
    format('Aposta sugerida: CARA (P=~2f)~n', [P]).

sugerir_aposta(cara_ou_coroa, coroa) :-
    probabilidade(cara_ou_coroa, coroa, P),
    P >= 0.5,
    format('Aposta sugerida: COROA (P=~2f)~n', [P]).

% -----------------------------
% JOGO 3: FUTEBOL 2X1
% -----------------------------
% Probabilidades simplificadas para vitória, empate e derrota
probabilidade(futebol, vitoria, 0.55).
probabilidade(futebol, empate, 0.25).
probabilidade(futebol, derrota, 0.20).

sugerir_aposta(futebol, vitoria) :-
    probabilidade(futebol, vitoria, P),
    P > 0.5,
    format('Aposta sugerida: Vitória (P=~2f)~n', [P]).

sugerir_aposta(futebol, empate) :-
    probabilidade(futebol, empate, P),
    P > 0.5,
    format('Aposta sugerida: Empate (P=~2f)~n', [P]).

sugerir_aposta(futebol, derrota) :-
    probabilidade(futebol, derrota, P),
    P > 0.5,
    format('Aposta sugerida: Derrota (P=~2f)~n', [P]).

% -----------------------------
% FUZZY - interpretação da probabilidade
% -----------------------------
nivel_confiança(P, alta) :- P >= 0.7.
nivel_confiança(P, media) :- P >= 0.4, P < 0.7.
nivel_confiança(P, baixa) :- P < 0.4.

interpretar(jogo, Opcao) :-
    probabilidade(jogo, Opcao, P),
    nivel_confiança(P, Nivel),
    format('Nivel de confiança para ~w: ~w (~2f)~n', [Opcao, Nivel, P]).

% -----------------------------
% EXEMPLO DE EXECUÇÃO
% -----------------------------
% Para testar:
% ?- sugerir_aposta(roleta, vermelho).
% ?- sugerir_aposta(cara_ou_coroa, cara).
% ?- sugerir_aposta(futebol, vitoria).
% ?- interpretar(roleta, vermelho).
