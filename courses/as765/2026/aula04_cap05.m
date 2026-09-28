%% AS-765, aula 4, capitulo 5, 28/09/2026
% Control System Toolbox. Executar este arquivo inteiro ou por secoes.
% As figuras exportadas acompanham os slides e nao exigem nova geracao.
clear; close all; clc
s = tf('s');
base = fileparts(mfilename('fullpath'));
[~,folderName] = fileparts(base);
if strcmp(folderName,'matlab'), base = fileparts(base); end
figdir = fullfile(base,'Figuras');
if ~exist(figdir,'dir'), mkdir(figdir); end
set(groot,'defaultAxesFontSize',20,'defaultLegendFontSize',17,'defaultLineLineWidth',2);

%% 1. Primeira ordem
K = 2; tau = 0.5; G = K/(tau*s+1);
t = (0:0.002:5)';
y = step(G,t);
yExata = K*(1-exp(-t/tau));
assert(max(abs(y-yExata)) < 1e-9);
I = stepinfo(y,t,K,'RiseTimeLimits',[0.1 0.9], ...
             'SettlingTimeThreshold',0.02);
fprintf('Primeira ordem: tr=%.4f, ts2=%.4f s\n',I.RiseTime,I.SettlingTime);
assert(abs(I.RiseTime-tau*log(9)) < 0.005);
assert(abs(I.SettlingTime+tau*log(0.02)) < 0.005);
figure('Name','Primeira ordem'); step(G,t); grid on
figure('Name','Impulso'); impulse(G,t); grid on
Gunit = 1/(tau*s+1);
yr = lsim(Gunit,t,t);
assert(abs((t(end)-yr(end))-tau) < 1e-4);

%% 2. Segunda ordem, massa-mola-amortecedor
m = 1; k = 4; c = 2.4;
Gm = 1/(m*s^2+c*s+k);
zeta = c/(2*sqrt(k*m)); wn = sqrt(k/m); wd = wn*sqrt(1-zeta^2);
t = (0:0.001:12)'; y = step(Gm,t);
yExata = (1/k)*(1-exp(-zeta*wn*t).*(cos(wd*t)+zeta*wn/wd*sin(wd*t)));
assert(max(abs(y-yExata)) < 1e-8);
I2 = stepinfo(y,t,dcgain(Gm),'RiseTimeLimits',[0.1 0.9], ...
    'SettlingTimeThreshold',0.02);
I5 = stepinfo(y,t,dcgain(Gm),'SettlingTimeThreshold',0.05);
Mp = 100*exp(-pi*zeta/sqrt(1-zeta^2)); tp = pi/wd;
assert(abs(I2.Overshoot-Mp) < 0.001);
assert(abs(I2.PeakTime-tp) < 0.002);
fprintf('Massa-mola: Mp=%.4f%% tp=%.4f ts2=%.4f ts5=%.4f s\n', ...
    Mp,tp,I2.SettlingTime,I5.SettlingTime);
figure('Name','Amortecimentos'); hold on
zetas = [0.2 0.5 0.7 1 1.5];
for z = zetas
    yy = step(1/(s^2+2*z*s+1),t);
    plot(t,yy,'DisplayName',sprintf('zeta = %.1f',z));
end
grid on; legend('Location','southeast'); xlabel('Tempo (s)'); ylabel('y/K');
% Verifica a expressao corrigida para zeta = 1.5 e wn = 1.
p1 = (-3+sqrt(5))/2; p2 = (-3-sqrt(5))/2;
ySobre = 1+(p2*exp(p1*t)-p1*exp(p2*t))/(p1-p2);
assert(max(abs(step(1/(s^2+3*s+1),t)-ySobre)) < 1e-8);

%% 3. Reducao de terceira para segunda ordem (exemplo de 2025)
t = (0:0.001:20)';
G3 = 10/((0.1*s+1)*(s+1)*(2*s+1));
G2 = 10/((s+1)*(2*s+1));
y3 = step(G3,t); y2 = step(G2,t);
assert(abs(dcgain(G3)-dcgain(G2)) < 1e-12);
I3 = stepinfo(y3,t,10,'SettlingTimeThreshold',0.02);
Ir = stepinfo(y2,t,10,'SettlingTimeThreshold',0.02);
fprintf('Reducao 3->2: erroMax=%.4f%% ts3=%.4f ts2=%.4f s\n', ...
    100*max(abs(y3-y2))/10,I3.SettlingTime,Ir.SettlingTime);
f = figure('Position',[100 100 760 480]);
plot(t,y3,t,y2,'--'); grid on; xlim([0 12]);
xlabel('Tempo (s)'); ylabel('Saida');
legend('Original: 3a ordem','Reduzido: 2a ordem','Location','southeast');
set(findall(f,'Type','axes'),'Toolbar',[]);
exportgraphics(f,fullfile(figdir,'reducao_3_2.pdf'),'ContentType','vector');

%% 4. Reducao para primeira ordem: residuos importam
Gorig = 50/((0.1*s+1)*(s+1)*(0.2*s+1)); Gred = 50/(s+1);
yo = step(Gorig,t); ya = step(Gred,t);
yExata = 50*(1-25/18*exp(-t)+0.5*exp(-5*t)-1/9*exp(-10*t));
assert(max(abs(yo-yExata)) < 1e-8);
Io = stepinfo(yo,t,50,'SettlingTimeThreshold',0.02);
Ia = stepinfo(ya,t,50,'SettlingTimeThreshold',0.02);
fprintf('Reducao 3->1: erroMax=%.4f%% ts3=%.4f ts1=%.4f s\n', ...
    100*max(abs(yo-ya))/50,Io.SettlingTime,Ia.SettlingTime);
fprintf('Em t=0.5: original=%.5f, reduzido=%.5f\n', ...
    interp1(t,yo,0.5),interp1(t,ya,0.5));
f = figure('Position',[100 100 760 480]);
plot(t,yo,t,ya,'--'); grid on; xlim([0 6]);
xlabel('Tempo (s)'); ylabel('Saida');
legend('Original: 3a ordem','Reduzido: 1a ordem','Location','southeast');
set(findall(f,'Type','axes'),'Toolbar',[]);
exportgraphics(f,fullfile(figdir,'reducao_3_1.pdf'),'ContentType','vector');

%% 5. Efeito dos zeros
GzE = (1+0.5*s)/((s+1)*(2*s+1));
GzD = (1-0.5*s)/((s+1)*(2*s+1));
figure('Name','Zeros'); step(GzE,GzD,t); grid on
legend('Zero em -2','Zero em +2','Location','southeast');

%% 6. Erro em regime permanente
L0 = 10/(s+2); L1 = 20/(s*(s+4));
T0 = feedback(L0,1); T1 = feedback(L1,1);
assert(isstable(T0) && isstable(T1));
Kp = dcgain(L0); Kv = dcgain(minreal(s*L1));
essDegrau = 1/(1+Kp); essRampa = 1/Kv;
assert(abs(essDegrau-1/6) < 1e-12 && abs(essRampa-0.2) < 1e-12);
t = (0:0.002:12)'; r = t; y = lsim(T1,r,t); e = r-y;
assert(abs(e(end)-essRampa) < 1e-8);
f = figure('Position',[100 100 760 480]);
subplot(2,1,1); plot(t,r,'--',t,y); grid on
xlabel('Tempo (s)'); ylabel('Amplitude'); legend('Referencia','Saida','Location','northwest');
subplot(2,1,2); plot(t,e); yline(essRampa,'--'); grid on
xlabel('Tempo (s)'); ylabel('Erro'); ylim([0 0.4]);
set(findall(f,'Type','axes'),'Toolbar',[]);
exportgraphics(f,fullfile(figdir,'erro_rampa.pdf'),'ContentType','vector');
% Sensor nao unitario: erro do somador nulo, erro de seguimento 0.5.
Ty = feedback(1/s,2);
assert(abs(dcgain(Ty)-0.5) < 1e-12);

%% 7. Exercicio integrado da aula anterior
L = 4/(s*(s+2)); T = feedback(L,1);
t = (0:0.001:15)'; y = step(T,t);
It = stepinfo(y,t,1,'SettlingTimeThreshold',0.02);
assert(isstable(T));
assert(abs(It.Overshoot-100*exp(-pi/sqrt(3))) < 1e-3);
assert(abs(dcgain(minreal(s*L))-2) < 1e-12);
fprintf('Integrado: Mp=%.4f%% tp=%.4f ts2=%.4f s\n', ...
    It.Overshoot,It.PeakTime,It.SettlingTime);
fprintf('Todas as verificacoes numericas passaram.\n');
