%% AS-765 2026 - Lista 2 - roteiro inicial (alunos)
% Requer Control System Toolbox. Complete os TODO e execute do inicio ao fim.
% As expressoes comentadas sao orientacoes; nao constituem solucao pronta.
clear; close all; clc;
s = tf('s');
%% Problema 1 - transferencias e resposta ao degrau
m=1; c=3; km=2; K=4;
t1=(0:.001:10)';
% TODO: derive P, Tr=Y/R, Td=Y/D e Tn=Y/N antes de programar.
% TODO: calcule polos, ganho estatico, wn, zeta e indices analiticos.
% y1=step(Tr,t1);
% S1=stepinfo(y1,t1,dcgain(Tr), ...
%     'SettlingTimeThreshold',.02,'RiseTimeLimits',[.1 .9]);
% TODO: compare estimativas e medidas; determine os deslocamentos devidos a
% forca constante e erro de sensor, usando as respectivas unidades.

%% Problema 2 - reducao e validacao
t2=(0:.001:30)';
t2_refinado=(0:.0005:30)';
valor_final=12; tolerancia=.05;
% TODO: implemente G3, G2 e G1 conforme o enunciado.
% TODO: calcule polos e ganhos; simule as tres respostas em t2.
% Para cada aproximacao, use max(abs(y_aprox-y3))/valor_final.
% TODO: calcule stepinfo com valor final explicito e banda de 2%.
% TODO: repita a metrica de erro em t2_refinado. Apresente tabela e graficos.
% TODO: justifique a escolha de menor ordem que atende a tolerancia.

%% Problema 3 - Routh e erro permanente
K_teste=40;
t3=(0:.001:30)'; r=t3;
% TODO: derive a tabela simbolicamente no relatorio, incluindo fronteiras.
% TODO: implemente a planta, a malha aberta L e a malha fechada T.
% TODO: calcule pole(T), Kv e erro analitico, depois de verificar estabilidade.
% y3=lsim(T,r,t3); e3=r-y3;
% TODO: plote o erro e compare e3(end) ao limite analitico.
% Se o transitorio ainda for perceptivel, indique isso; nao substitua o limite
% analitico pelo ultimo ponto da simulacao.
disp('Roteiro carregado. Complete os TODO antes da entrega.');
