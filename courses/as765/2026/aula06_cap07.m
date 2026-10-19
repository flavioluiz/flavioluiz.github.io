%% AS-765 - Aula 6, Capitulo 7 - 19/10/2026
% Requer MATLAB e Control System Toolbox. Execute as secoes em ordem.
clear; close all; clc;
s = tf('s');
w = sort(unique([logspace(-2,3,1001),0.2,2,5,10,20,50,100]))';

%% 1. Resposta senoidal e transitorio
G = 2/(s+1); A = 3; w0 = 1;
t = (0:0.002:12)'; u = A*sin(w0*t);
H0 = evalfr(G,1j*w0);
y = lsim(G,u,t);
yss = A*abs(H0)*sin(w0*t+angle(H0));
yexato = 3*(sin(t)-cos(t)+exp(-t));
assert(isstable(G));
assert(max(abs(y-yexato))<1e-4);
assert(abs(abs(H0)-sqrt(2))<1e-12);
figure('Name','Resposta senoidal');
plot(t,y,t,yss,'--',t,y-yss,':'); grid on
xlabel('t [s]'); ylabel('Amplitude');
legend('Saida completa','Regime','Transitorio');

%% 2. Primeira ordem: fator normalizado, quebra e banda relativa
G1 = 10/(s+5);
H5 = evalfr(G1,5j);
assert(abs(H5-(1-1j))<1e-12);
assert(abs(20*log10(abs(H5))-3.01029995664)<1e-9);
fprintf('Primeira ordem: DC %.4f, quebra 5 rad/s, modulo %.4f, fase %.2f graus\n',...
    dcgain(G1),abs(H5),rad2deg(angle(H5)));
% Meia potencia, sem depender do limiar arredondado de bandwidth:
tau = 0.2; wBW = 1/tau;
tr = tau*log(9); ts = -tau*log(0.02);
fprintf('Banda %.3f rad/s, tr10-90 %.4f s, ts2%% %.4f s\n',wBW,tr,ts);
figure('Name','Primeira ordem'); bode(G1,w); grid on

%% 3. Segunda ordem: quadrante, ressonancia e modos naturais
wn = 5; zeta = 0.6;
G2 = wn^2/(s^2+2*zeta*wn*s+wn^2);
wr = wn*sqrt(1-2*zeta^2);
Mr = 1/(2*zeta*sqrt(1-zeta^2));
wd = wn*sqrt(1-zeta^2);
assert(abs(abs(evalfr(G2,1j*wr))-Mr)<1e-12);
assert(abs(rad2deg(angle(evalfr(G2,1j*wn)))+90)<1e-12);
fprintf('Segunda ordem: wn %.4f, wd %.4f, wr %.4f rad/s, Mr %.6f\n',wn,wd,wr,Mr);
figure('Name','Amortecimentos');
bode(wn^2/(s^2+2*0.2*wn*s+wn^2),G2,...
    wn^2/(s^2+2*wn*s+wn^2),w); grid on
legend('zeta=0.2','zeta=0.6','zeta=1');

%% 4. Bode composto: formula, assintotas e tres caminhos de calculo
GA = 10*(1+s/2)/(s*(1+s/10));
assert(~isstable(GA)); % apenas construcao algebrica para w>0
H = squeeze(freqresp(GA,w)); H = H(:);
[mb,pb] = bode(GA,w); mb = squeeze(mb); mb = mb(:);
pb = squeeze(pb); pb = pb(:);
Lf = 20-20*log10(w)+10*log10(1+(w/2).^2)-10*log10(1+(w/10).^2);
pf = -90+rad2deg(atan(w/2))-rad2deg(atan(w/10));
Las = 20-20*log10(w)+20*max(0,log10(w/2))-20*max(0,log10(w/10));
assert(max(abs(Lf-20*log10(abs(H))))<1e-10);
assert(max(abs(mb-abs(H)))<1e-9);
assert(max(abs(pf-rad2deg(unwrap(angle(H)))))<1e-9);
% Diferencas de fase sempre comparadas modulo 360 graus.
assert(max(abs(rad2deg(angle(exp(1j*deg2rad(pb-pf))))))<1e-9);
figure('Name','Composto e assintotas');
subplot(2,1,1); semilogx(w,Lf,w,Las,'--'); grid on
xlabel('w [rad/s]'); ylabel('Magnitude [dB]'); legend('Exata','Assintotas');
subplot(2,1,2); semilogx(w,pf); grid on
xlabel('w [rad/s]'); ylabel('Fase [graus]');

%% 5. Mesmo modulo e fases diferentes
Pm = 10*(1+s/2)/((1+s)*(1+s/10));
Pp = 10*(1-s/2)/((1+s)*(1+s/10));
Hm = squeeze(freqresp(Pm,w)); Hm = Hm(:);
Hp = squeeze(freqresp(Pp,w)); Hp = Hp(:);
assert(isstable(Pm) && isstable(Pp));
assert(max(abs(abs(Hm)-abs(Hp)))<1e-10);
assert(abs(rad2deg(angle(evalfr(Pp/Pm,2j)))+90)<1e-10);
figure('Name','Zeros em semiplanos diferentes'); bode(Pm,Pp,w); grid on
legend('Zero em -2','Zero em +2');
figure('Name','Resposta ao degrau'); step(Pm,Pp); grid on
legend('Zero em -2','Zero em +2');

%% 6. Atraso exato
G0 = 2/(1+s/5); Gt = G0; Gt.InputDelay = 0.1;
Hsem = evalfr(G0,5j); Hcom = evalfr(Gt,5j);
assert(abs(abs(Hsem)-abs(Hcom))<1e-12);
assert(abs(angle(Hcom/Hsem)+0.5)<1e-12);
figure('Name','Atraso puro'); bode(G0,Gt,w); grid on
legend('Sem atraso','Atraso 0.1 s');

%% 7. Exercicio final
Hex = 4*(1+s/5)/((1+s/0.5)*(1+s/50));
h5 = evalfr(Hex,5j);
assert(isstable(Hex));
assert(abs(abs(h5)-4*sqrt(2)/(sqrt(101)*sqrt(1.01)))<1e-12);
fprintf('Exercicio final: |H(j5)| %.6f, magnitude %.4f dB, fase %.4f graus\n',...
    abs(h5),20*log10(abs(h5)),rad2deg(angle(h5)));
figure('Name','Exercicio final'); bode(Hex,w); grid on
fprintf('Todas as conferencias numericas passaram.\n');
