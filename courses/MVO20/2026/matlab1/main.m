clc; clear all;
% simular o sistema massa-mola-amortecedor
% parametros do modelo:
p.m = 1;
p.k = 20;
p.c = 0.5;
p.xbar = 1;

Ti = 0;
Tf = 10;
X0 = [1.2;0];
% inclusao de argumentos adicionais ao (t,X, ...)
F = 0;
options = [];
[vetorT matrizX] = ode45(@dinamica, [Ti Tf], X0, options, F, p);

% inclusao de argumentos adicionais modificando os argumentos da dinamica
% usando function handler @(t,x)
[vetorT matrizX] = ode45(@(t,X)dinamica(t,X,F,p), [Ti Tf], X0, options);

figure;
subplot(211)
plot(vetorT, matrizX(:,1));
xlabel('tempo (s)');
ylabel('posição (x)');
subplot(212)
plot(vetorT, matrizX(:,2));
xlabel('tempo (s)');
ylabel('velocidade (m/s)');
