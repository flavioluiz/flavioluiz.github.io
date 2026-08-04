%% Aula 04: linearizacao numerica e validacao
% Gera as figuras usadas nos slides e reproduz os resultados numericos.

clear; clc; close all;

%% 1) Diferencas finitas centradas vs. complex step
fun_test = @(x) [sin(x(1)) + x(2)^2; ...
                 x(1)*x(3) + exp(x(2)); ...
                 x(1)^2 + x(2)^2 + x(3)^2];
x0 = [1.2; -0.8; 0.5];
J_test = [cos(x0(1)), 2*x0(2), 0; ...
          x0(3), exp(x0(2)), x0(1); ...
          2*x0(1), 2*x0(2), 2*x0(3)];

passos = logspace(-16,-1,180);
erro_fd = zeros(size(passos));
erro_cs = zeros(size(passos));
for k = 1:numel(passos)
    erro_fd(k) = max(abs(jac_fd(fun_test,x0,passos(k))-J_test),[],'all');
    erro_cs(k) = max(abs(jac_cs(fun_test,x0,passos(k))-J_test),[],'all');
end
erro_fd = max(erro_fd,eps);
erro_cs = max(erro_cs,eps);

fig = figure('Color','w','Position',[100 100 1350 720]);
loglog(passos,erro_fd,'-o','Color',[0.00 0.45 0.74], ...
    'LineWidth',1.8,'MarkerSize',3); hold on;
loglog(passos,erro_cs,'-s','Color',[0.85 0.33 0.10], ...
    'LineWidth',1.8,'MarkerSize',3);
xline(eps^(1/3),'--','h \approx \epsilon_{maq}^{1/3}', ...
    'LabelVerticalAlignment','middle','LabelHorizontalAlignment','left', ...
    'LineWidth',1.2,'Color',[0.25 0.25 0.25]);
grid on;
xlabel('magnitude do passo');
ylabel('erro maximo na Jacobiana');
title('Precisao numerica da Jacobiana');
legend('diferencas finitas centradas','complex step', ...
    'Location','southwest');
set(gca,'FontSize',15,'LineWidth',1.0);
exportgraphics(fig,'Figuras/erro_jacobiana.png','Resolution',220);

%% 2) Motor CC com carga quadratica
R = 2; L = 0.5; J = 0.02; b = 0.1; kt = 0.1; ke = 0.1; c = 0.002;
motor = @(z) [-R/L*z(1)-ke/L*z(2)+z(3)/L; ...
              kt/J*z(1)-b/J*z(2)-c/J*z(2)^2];
zbar = [5.5; 5; 11.5];
J_motor = [-R/L, -ke/L, 1/L; ...
            kt/J, -(b+2*c*zbar(2))/J, 0];

J_fd_motor = jac_fd_scaled(motor,zbar);
J_cs_motor = jac_cs(motor,zbar,1e-100);
fprintf('Residuo do equilibrio do motor: %.3e\n',norm(motor(zbar),inf));
fprintf('Erro FD centrada: %.3e\n',max(abs(J_fd_motor-J_motor),[],'all'));
fprintf('Erro complex step: %.3e\n',max(abs(J_cs_motor-J_motor),[],'all'));
disp('Jacobiana [A B] analitica:'); disp(J_motor);
disp('Jacobiana [A B] por diferencas finitas:'); disp(J_fd_motor);
disp('Jacobiana [A B] por complex step:'); disp(J_cs_motor);

%% 3) Teste do resto de Taylor
direcao = [0.5; 1.0; 0.3];
alpha = logspace(-6,0,100);
erro_local = zeros(size(alpha));
for k = 1:numel(alpha)
    dz = alpha(k)*direcao;
    erro_local(k) = norm(motor(zbar+dz)-motor(zbar)-J_motor*dz,2);
end
ref = erro_local(55)*(alpha/alpha(55)).^2;

fig = figure('Color','w','Position',[100 100 1250 700]);
loglog(alpha,erro_local,'-o','Color',[0.00 0.45 0.74], ...
    'LineWidth',2.0,'MarkerSize',3); hold on;
loglog(alpha,ref,'--','Color',[0.85 0.33 0.10],'LineWidth',1.8);
grid on;
xlabel('escala da perturbacao, \alpha');
ylabel('norma do resto de Taylor');
title('Validacao local: o erro decresce como \alpha^2');
legend('erro medido','referencia de inclinacao 2','Location','northwest');
set(gca,'FontSize',15,'LineWidth',1.0);
exportgraphics(fig,'Figuras/erro_taylor_motor.png','Resolution',220);

%% 4) Comparacao no tempo para perturbacao pequena e grande
A = J_motor(:,1:2); B = J_motor(:,3);
tspan = [0 5];
amplitudes = [0.25 3.0];
fig = figure('Color','w','Position',[100 100 1350 620]);
for p = 1:2
    dv = amplitudes(p);
    entrada = @(t) dv*(t>=0.5);
    rhs_nl = @(t,x) motor([x; zbar(3)+entrada(t)]);
    rhs_lin = @(t,dx) A*dx+B*entrada(t);
    [tnl,xnl] = ode45(rhs_nl,tspan,zbar(1:2));
    [tlin,dxlin] = ode45(rhs_lin,tspan,[0;0]);
    subplot(1,2,p);
    plot(tnl,xnl(:,2),'Color',[0.00 0.45 0.74],'LineWidth',2.0); hold on;
    plot(tlin,zbar(2)+dxlin(:,2),'--','Color',[0.85 0.33 0.10],'LineWidth',2.0);
    xline(0.5,':','perturbacao','LabelVerticalAlignment','bottom');
    grid on;
    xlabel('tempo (s)'); ylabel('\omega (rad/s)');
    title(sprintf('Degrau incremental de %.2g V',dv));
    legend('nao linear','linear local','Location','best');
    set(gca,'FontSize',13,'LineWidth',1.0);
end
exportgraphics(fig,'Figuras/validacao_tempo_motor.png','Resolution',220);

%% Funcoes auxiliares
function J = jac_fd(fun,z,h)
    f0 = fun(z);
    J = zeros(numel(f0),numel(z));
    for j = 1:numel(z)
        dz = zeros(size(z)); dz(j) = h;
        J(:,j) = (fun(z+dz)-fun(z-dz))/(2*h);
    end
end

function J = jac_fd_scaled(fun,z)
    f0 = fun(z);
    J = zeros(numel(f0),numel(z));
    eta = eps^(1/3);
    for j = 1:numel(z)
        h = eta*max(1,abs(z(j)));
        dz = zeros(size(z)); dz(j) = h;
        J(:,j) = (fun(z+dz)-fun(z-dz))/(2*h);
    end
end

function J = jac_cs(fun,z,h)
    if nargin < 3, h = 1e-100; end
    f0 = fun(z);
    J = zeros(numel(f0),numel(z));
    for j = 1:numel(z)
        zc = z; zc(j) = zc(j)+1i*h;
        J(:,j) = imag(fun(zc))/h;
    end
end
