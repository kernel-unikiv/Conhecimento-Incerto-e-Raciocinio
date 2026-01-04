% ======================================
% ApostaIA - Redes Bayesianas
% Jogos: Roleta, Cara ou Coroa, Futebol 2x1
% ======================================

% -----------------------------
% JOGO 1: ROLETAS (cores)
% -----------------------------
% Probabilidades a priori
prior(roleta, vermelho, 18/37).
prior(roleta, preto, 18/37).
prior(roleta, verde, 1/37).

% Atualiza probabilidade condicional baseada em evidência (simulação)
bayes(roleta, Cor, P_posterior) :-
    prior(roleta, Cor, P),
    evidencias_roleta(Cor, E),
    P_posterior is (P * E) / ((P*E) + ((1-P)*(1-E))),
    format('Roleta: Probabilidade posterior de ~w = ~2f~n', [Cor, P_posterior]).

% Evidência simulada (fator externo, p.ex. últimos giros)
evidencias_roleta(vermelho, 0.6).
evidencias_roleta(preto, 0.4).
evidencias_roleta(verde, 0.1).

% -----------------------------
% JOGO 2: CARA OU COROA
% -----------------------------
prior(cara_ou_coroa, cara, 0.5).
prior(cara_ou_coroa, coroa, 0.5).

bayes(cara_ou_coroa, Opcao, P_posterior) :-
    prior(cara_ou_coroa, Opcao, P),
    evidencias_cara_ou_coroa(Opcao, E),
    P_posterior is (P * E) / ((P*E) + ((1-P)*(1-E))),
    format('Cara ou Coroa: Probabilidade posterior de ~w = ~2f~n', [Opcao, P_posterior]).

evidencias_cara_ou_coroa(cara, 0.52).
evidencias_cara_ou_coroa(coroa, 0.48).

% -----------------------------
% JOGO 3: FUTEBOL 2X1
% -----------------------------
prior(futebol, vitoria, 0.55).
prior(futebol, empate, 0.25).
prior(futebol, derrota, 0.20).

bayes(futebol, Resultado, P_posterior) :-
    prior(futebol, Resultado, P),
    evidencias_futebol(Resultado, E),
    P_posterior is (P * E) / ((P*E) + ((1-P)*(1-E))),
    format('Futebol: Probabilidade posterior de ~w = ~2f~n', [Resultado, P_posterior]).

% Evidências simuladas
evidencias_futebol(vitoria, 0.6).   % ex: casa jogando + histórico favorável
evidencias_futebol(empate, 0.3).
evidencias_futebol(derrota, 0.2).

% -----------------------------
% Lógica Fuzzy: interpretação da confiança
% -----------------------------
nivel_confiança(P, alta) :- P >= 0.7.
nivel_confiança(P, media) :- P >= 0.4, P < 0.7.
nivel_confiança(P, baixa) :- P < 0.4.

interpretar_jogo(Jogo, Opcao) :-
    bayes(Jogo, Opcao, P),
    nivel_confiança(P, Nivel),
    format('Nivel de confiança para ~w: ~w (~2f)~n', [Opcao, Nivel, P]).
