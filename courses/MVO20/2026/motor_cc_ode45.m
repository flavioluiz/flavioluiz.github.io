% MVO-20 - Aula 02
% Motor CC: degrau de tensao e aplicacao de torque de carga

clear; close all; clc;

R  = 2.0;      % ohm
L  = 0.5;      % H
J  = 0.02;     % kg.m^2
b  = 0.10;     % N.m.s/rad
kt = 0.10;     % N.m/A
ke = 0.10;     % V.s/rad

va   = @(t) 12.0;
tauL = @(t) 0.20*(t >= 2.0);

f = @(t,x) [ ...
    (va(t) - R*x(1) - ke*x(2))/L; ...
    (kt*x(1) - b*x(2) - tauL(t))/J ];

opts = odeset('MaxStep',1e-2,'RelTol',1e-8,'AbsTol',1e-10);
[t,x] = ode45(f,[0 5],[0;0],opts);

i = x(:,1);
omega = x(:,2);

fig = figure('Color','w','Position',[100 100 1000 560]);

subplot(2,1,1)
plot(t,i,'LineWidth',2.5,'Color',[0.14 0.32 0.49]);
hold on
plot([2 2],ylim,'--','LineWidth',1.6,'Color',[0.67 0.22 0.22]);
grid on
set(gca,'FontSize',24,'LineWidth',1.2)
ylabel('i (A)','FontSize',26)
title('Motor CC: degrau de 12 V e carga de 0,20 N m em t = 2 s','FontSize',22)
legend('corrente','aplicacao da carga','Location','southeast','FontSize',20)

subplot(2,1,2)
plot(t,omega,'LineWidth',2.5,'Color',[0.26 0.53 0.35]);
hold on
plot([2 2],ylim,'--','LineWidth',1.6,'Color',[0.67 0.22 0.22]);
grid on
set(gca,'FontSize',24,'LineWidth',1.2)
xlabel('tempo (s)','FontSize',26)
ylabel('\omega (rad/s)','FontSize',26)
legend('velocidade','aplicacao da carga','Location','southeast','FontSize',20)

print(fig,'Figuras/motor_cc_resposta.png','-dpng','-r180');
