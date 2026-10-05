%% Aula 15 - Resposta senoidal e interpretacao de G(jw)
% MVO-20, 06/10/2026. Requer Control System Toolbox.
% Todos os exemplos usam frequencias em rad/s.
clear; close all; clc;
s = tf('s');
G = 2/(s+1);
assert(isstable(G));

%% Ponto de frequencia e tabela dos slides
w = [0.1; 1; 10];
H = squeeze(freqresp(G,w));
H = H(:);
fprintf('  w [rad/s]    modulo    fase [graus]   amplitude para A=3\n');
disp([w,abs(H),rad2deg(angle(H)),3*abs(H)]);
assert(abs(evalfr(G,1j)-(1-1j)) < 1e-12);

%% Resposta completa, transitorio e regime
t = (0:0.002:12)';
u = 3*sin(t);
H1 = evalfr(G,1j);
y = lsim(G,u,t);
yss = 3*abs(H1)*sin(t+angle(H1));
yexato = 3*(sin(t)-cos(t)+exp(-t));
erro = max(abs(y-yexato));
assert(erro < 1e-4);
fprintf('Erro maximo lsim / solucao exata = %.3g\n',erro);
figure('Name','Primeira ordem: resposta completa');
plot(t,u,t,y,t,yss,'--','LineWidth',1.4); grid on;
xlabel('t [s]'); ylabel('Amplitude');
legend('Entrada','Saida completa','Regime senoidal','Location','best');

%% Pausa ativa: fase inicial da entrada
Ga = 1.5/(0.8*s+1);
wa = 1.25; Aa = 2; theta = pi/6;
Ha = evalfr(Ga,1j*wa);
assert(abs(Ha-(0.75-0.75j)) < 1e-12);
B = Aa*abs(Ha);
fase_saida = theta+angle(Ha);
atraso = -angle(Ha)/wa;
assert(abs(B-3/sqrt(2)) < 1e-12);
assert(abs(fase_saida+pi/12) < 1e-12);
fprintf('Atividade: B=%.6f, fase saida=%.3f graus, atraso=%.6f s\n',...
    B,rad2deg(fase_saida),atraso);

%% Modelo de segunda ordem da aula 10
G2 = 50/(s^2+6*s+25);
H2 = squeeze(freqresp(G2,[5 10]));
assert(abs(H2(1)+5j/3) < 1e-12);
assert(abs(rad2deg(angle(H2(2)))+141.340191745910) < 1e-9);
disp('Segunda ordem: modulo e fase para w=5 e 10 rad/s');
disp([abs(H2(:)),rad2deg(angle(H2(:)))]);

%% Superposicao
tlong = (0:0.005:160)';
umix = sin(0.1*tlong)+0.5*sin(10*tlong);
Hslow = evalfr(G,0.1j); Hfast = evalfr(G,10j);
ymix = lsim(G,umix,tlong);
ymixss = abs(Hslow)*sin(0.1*tlong+angle(Hslow)) + ...
    0.5*abs(Hfast)*sin(10*tlong+angle(Hfast));
figure('Name','Superposicao');
plot(tlong,umix,tlong,ymix,tlong,ymixss,'--'); grid on;
xlabel('t [s]'); ylabel('Amplitude');
legend('Entrada','Saida completa','Regime','Location','best');

%% Canal de malha fechada
L = 2/(s+1);
Tr = feedback(L,1);
assert(isstable(Tr));
assert(abs(evalfr(Tr,1j)-(0.6-0.2j)) < 1e-12);

%% Contraexemplo: avaliacao finita, resposta instavel
Gu = 1/(s-1);
tu = (0:0.002:5)';
yu = lsim(Gu,sin(tu),tu);
yuexato = 0.5*(exp(tu)-cos(tu)-sin(tu));
assert(~isstable(Gu));
assert(max(abs(yu-yuexato)) < 1e-3);
figure('Name','Polo instavel');
plot(tu,yu,tu,-0.5*(cos(tu)+sin(tu)),'--'); grid on;
xlabel('t [s]'); ylabel('Amplitude');
legend('Resposta completa','Solucao particular senoidal','Location','best');

%% Verificacao de saida
Gticket = 4/(s+2);
assert(abs(evalfr(Gticket,2j)-(1-1j)) < 1e-12);
disp('Verificacoes numericas da aula 15 concluidas.');
