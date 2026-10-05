%% Aula 16 - Diagramas de Bode: fatores elementares
% MVO-20, 09/10/2026. Requer Control System Toolbox.
clear; close all; clc;
s = tf('s');
w = logspace(-2,2,501)';
Gp = 1/(1+s);
Hp = squeeze(freqresp(Gp,w)); Hp = Hp(:);
Hz = 1+1j*w;                    % avaliacao algebrica do fator improprio
Lint = -20*log10(w);
Lder = 20*log10(w);

%% Polo e zero reais
Lpas = zeros(size(w));
Lpas(w>1) = -20*log10(w(w>1));
phaseas = zeros(size(w));
mid = w>0.1 & w<10;
phaseas(mid) = -45*(1+log10(w(mid)));
phaseas(w>=10) = -90;
figure('Name','Polo real: exato e aproximado');
subplot(2,1,1);
semilogx(w,20*log10(abs(Hp)),w,Lpas,'--','LineWidth',1.4); grid on;
ylabel('Magnitude [dB]'); legend('Exata','Assintotas','Location','best');
subplot(2,1,2);
semilogx(w,rad2deg(angle(Hp)),w,phaseas,'--','LineWidth',1.4); grid on;
ylabel('Fase [graus]'); xlabel('Frequencia [rad/s]');
figure('Name','Polo e zero');
subplot(2,1,1);
semilogx(w,20*log10(abs(Hp)),w,20*log10(abs(Hz)),'LineWidth',1.4); grid on;
ylabel('Magnitude [dB]'); legend('Polo','Zero','Location','best');
subplot(2,1,2);
semilogx(w,rad2deg(angle(Hp)),w,rad2deg(angle(Hz)),'LineWidth',1.4); grid on;
ylabel('Fase [graus]'); xlabel('Frequencia [rad/s]');
assert(max(abs(20*log10(abs(Hp))+20*log10(abs(Hz)))) < 1e-10);

%% Unidades de bode e ponto de quebra
[mp,pp] = bode(Gp,1);
assert(abs(mp(1)-1/sqrt(2)) < 1e-12);
assert(abs(pp(1)+45) < 1e-10);
Gex = 10/(s+5);
Hex = evalfr(Gex,5j);
assert(abs(Hex-(1-1j)) < 1e-12);
fprintf('G=10/(s+5), w=5: %.6f dB, %.3f graus\n',...
    20*log10(abs(Hex)),rad2deg(angle(Hex)));

%% Par de polos normalizado
zetas = [0.2 0.6 1.0];
figure('Name','Segunda ordem');
for k = 1:numel(zetas)
    z = zetas(k);
    G2 = 1/(s^2+2*z*s+1);
    H2 = squeeze(freqresp(G2,w)); H2 = H2(:);
    assert(abs(abs(evalfr(G2,1j))-1/(2*z)) < 1e-12);
    subplot(2,1,1); hold on;
    semilogx(w,20*log10(abs(H2)),'LineWidth',1.4);
    subplot(2,1,2); hold on;
    semilogx(w,rad2deg(angle(H2)),'LineWidth',1.4);
end
subplot(2,1,1); set(gca,'XScale','log'); grid on;
ylabel('Magnitude [dB]'); legend('zeta=0.2','zeta=0.6','zeta=1');
subplot(2,1,2); set(gca,'XScale','log'); grid on;
ylabel('Fase [graus]'); xlabel('w/wn');
Gknown = 50/(s^2+6*s+25);
assert(abs(20*log10(abs(evalfr(Gknown,5j)))-20*log10(5/3)) < 1e-12);

%% Zero no semiplano direito: mesmo modulo, outra fase
Hzright = 1-1j*w;
assert(max(abs(abs(Hzright)-abs(Hz))) < 1e-12);
assert(max(abs(angle(Hzright)+angle(Hz))) < 1e-12);

%% Atividade de reconhecimento
F1 = 1/(1+s/4);
F4 = 100/(s^2+4*s+100);
assert(abs(rad2deg(angle(evalfr(F1,4j)))+45) < 1e-10);
assert(abs(abs(evalfr(F4,10j))-2.5) < 1e-12);
fprintf('F4 em wn: %.6f dB\n',20*log10(abs(evalfr(F4,10j))));

%% Preparacao para 13/10: conferir adicao de fatores
Gc = 10*(1+s/2)/(s*(1+s/10));
Hc = squeeze(freqresp(Gc,w)); Hc = Hc(:);
Lc = 20-20*log10(w)+10*log10(1+(w/2).^2)-10*log10(1+(w/10).^2);
pc = -90+rad2deg(atan(w/2))-rad2deg(atan(w/10));
assert(max(abs(Lc-20*log10(abs(Hc)))) < 1e-10);
assert(max(abs(pc-rad2deg(angle(Hc)))) < 1e-10);
disp('Verificacoes numericas da aula 16 concluidas.');
