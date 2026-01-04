% ======================================
% ApostaIA - Dempster-Shafer
% Jogos: Roleta, Cara ou Coroa, Futebol 2x1
% ======================================

% -----------------------------
% FUNÇÃO AUXILIAR: Combinação de crenças
% -----------------------------
% Combina duas massas m1 e m2 segundo regra de Dempster-Shafer
% m(A) = (Σ m1(B) * m2(C)) / (1 - K), onde B ∩ C = A
combinar(M1, M2, Resultado) :-
    K is 1 - (M1 * M2 + (1-M1)*(1-M2)),
    Resultado is (M1*M2)/(1-K).

% -----------------------------
% JOGO 1: ROLETAS
% -----------------------------
% Evidências sobre vermelho e preto
massa(roleta, vermelho, 0.6).   % ex: últimos giros favorecem vermelho
massa(roleta, preto, 0.3).
massa(roleta, verde, 0.1).

sugerir_aposta_dempster(roleta, Cor) :-
    massa(roleta, Cor, M1),
    massa(roleta, Cor, M2),    % simulando segunda evidência
    combinar(M1, M2, M),
    nivel_confiança(M, Nivel),
    format('Roleta: ~w -> Crença combinada=~2f, Nivel de confiança=~w~n', [Cor, M, Nivel]).

% -----------------------------
% JOGO 2: CARA OU COROA
% -----------------------------
massa(cara_ou_coroa, cara, 0.52).
massa(cara_ou_coroa, coroa, 0.48).

sugerir_aposta_dempster(cara_ou_coroa, Opcao) :-
    massa(cara_ou_coroa, Opcao, M1),
    massa(cara_ou_coroa, Opcao, M2),
    combinar(M1, M2, M),
    nivel_confiança(M, Nivel),
    format('Cara ou Coroa: ~w -> Crença combinada=~2f, Nivel de confiança=~w~n', [Opcao, M, Nivel]).

% -----------------------------
% JOGO 3: FUTEBOL 2X1
% -----------------------------
massa(futebol, vitoria, 0.55).
massa(futebol, empate, 0.25).
massa(futebol, derrota, 0.2).

sugerir_aposta_dempster(futebol, Resultado) :-
    massa(futebol, Resultado, M1),
    massa(futebol, Resultado, M2),
    combinar(M1, M2, M),
    nivel_confiança(M, Nivel),
    format('Futebol: ~w -> Crença combinada=~2f, Nivel de confiança=~w~n', [Resultado, M, Nivel]).

% -----------------------------
% Lógica Fuzzy para interpretação
% -----------------------------
nivel_confiança(P, alta) :- P >= 0.7.
nivel_confiança(P, media) :- P >= 0.4, P < 0.7.
nivel_confiança(P, baixa) :- P < 0.4.

% -----------------------------
% EXEMPLOS DE EXECUÇÃO
% -----------------------------
% ?- sugerir_aposta_dempster(roleta, vermelho).
% ?- sugerir_aposta_dempster(cara_ou_coroa, cara).
% ?- sugerir_aposta_dempster(futebol, vitoria).
