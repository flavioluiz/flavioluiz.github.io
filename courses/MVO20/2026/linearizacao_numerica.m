%% Aula 04: linearizacao numerica e validacao
% Gera as figuras usadas nos slides e reproduz os resultados numericos.
% Estados e entradas sao mantidos como argumentos separados da dinamica.

clear; clc; close all;

%% 1) Diferencas finitas centradas vs. complex step
funcao_teste = @(X) [sin(X(1)) + X(2)^2; ...
                      X(1)*X(3) + exp(X(2)); ...
                      X(1)^2 + X(2)^2 + X(3)^2];
Xeq_teste = [1.2; -0.8; 0.5];
J_teste = [cos(Xeq_teste(1)), 2*Xeq_teste(2), 0; ...
           Xeq_teste(3), exp(Xeq_teste(2)), Xeq_teste(1); ...
           2*Xeq_teste(1), 2*Xeq_teste(2), 2*Xeq_teste(3)];

passos = logspace(-16,-1,180);
erro_fd = zeros(size(passos));
erro_cs = zeros(size(passos));
for k = 1:numel(passos)
    J_fd = lineariza_passo(funcao_teste,Xeq_teste,passos(k));
    J_cs = lineariza_complex_passo(funcao_teste,Xeq_teste,passos(k));
    erro_fd(k) = max(abs(J_fd-J_teste),[],'all');
    erro_cs(k) = max(abs(J_cs-J_teste),[],'all');
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
dinamica = @(X,U) [-R/L*X(1)-ke/L*X(2)+U/L; ...
                    kt/J*X(1)-b/J*X(2)-c/J*X(2)^2];

Xeq = [5.5; 5];
Ueq = 11.5;

A_analitica = [-R/L, -ke/L; ...
                kt/J, -(b+2*c*Xeq(2))/J];
B_analitica = [1/L; 0];

% Abordagem usada em sala: uma chamada para cada argumento da dinamica.
A = lineariza(@(X) dinamica(X,Ueq),Xeq);
B = lineariza(@(U) dinamica(Xeq,U),Ueq);
A_cs = lineariza_complex_passo(@(X) dinamica(X,Ueq),Xeq,1e-100);
B_cs = lineariza_complex_passo(@(U) dinamica(Xeq,U),Ueq,1e-100);

residuo = dinamica(Xeq,Ueq);
fprintf('Residuo do equilibrio do motor: %.3e\n',norm(residuo,inf));
fprintf('Erro de A por diferencas finitas: %.3e\n', ...
    max(abs(A-A_analitica),[],'all'));
fprintf('Erro de B por diferencas finitas: %.3e\n', ...
    max(abs(B-B_analitica),[],'all'));
fprintf('Erro de A por complex step: %.3e\n', ...
    max(abs(A_cs-A_analitica),[],'all'));
fprintf('Erro de B por complex step: %.3e\n', ...
    max(abs(B_cs-B_analitica),[],'all'));
disp('Matriz A analitica:'); disp(A_analitica);
disp('Matriz A por lineariza:'); disp(A);
disp('Matriz B analitica:'); disp(B_analitica);
disp('Matriz B por lineariza:'); disp(B);

%% 3) Teste do resto de Taylor
direcao_X = [0.5; 1.0];
direcao_U = 0.3;
alpha = logspace(-6,0,100);
erro_local = zeros(size(alpha));
for k = 1:numel(alpha)
    delta_X = alpha(k)*direcao_X;
    delta_U = alpha(k)*direcao_U;
    resto = dinamica(Xeq+delta_X,Ueq+delta_U) ...
        - residuo - A_analitica*delta_X - B_analitica*delta_U;
    erro_local(k) = norm(resto,2);
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
tspan = [0 5];
amplitudes = [0.25 3.0];
fig = figure('Color','w','Position',[100 100 1350 620]);
for p = 1:2
    delta_U = amplitudes(p);
    entrada = @(t) delta_U*(t>=0.5);
    rhs_nl = @(t,X) dinamica(X,Ueq+entrada(t));
    rhs_lin = @(t,delta_X) A*delta_X+B*entrada(t);
    [tnl,Xnl] = ode45(rhs_nl,tspan,Xeq);
    [tlin,delta_X_lin] = ode45(rhs_lin,tspan,[0;0]);
    subplot(1,2,p);
    plot(tnl,Xnl(:,2),'Color',[0.00 0.45 0.74],'LineWidth',2.0); hold on;
    plot(tlin,Xeq(2)+delta_X_lin(:,2),'--', ...
        'Color',[0.85 0.33 0.10],'LineWidth',2.0);
    xline(0.5,':','perturbacao','LabelVerticalAlignment','bottom');
    grid on;
    xlabel('tempo (s)'); ylabel('\omega (rad/s)');
    title(sprintf('Degrau incremental de %.2g V',delta_U));
    legend('nao linear','linear local','Location','best');
    set(gca,'FontSize',13,'LineWidth',1.0);
end
exportgraphics(fig,'Figuras/validacao_tempo_motor.png','Resolution',220);

%% Funcoes auxiliares para estudar o efeito do passo
function J = lineariza_passo(funcao,X,h)
    Ny = length(funcao(X));
    Nx = length(X);
    J = zeros(Ny,Nx);
    for j = 1:Nx
        delta = zeros(size(X));
        delta(j) = h;
        J(:,j) = (funcao(X+delta)-funcao(X-delta))/(2*h);
    end
end

function J = lineariza_complex_passo(funcao,X,h)
    if nargin < 3, h = 1e-100; end
    Ny = length(funcao(X));
    Nx = length(X);
    J = zeros(Ny,Nx);
    for j = 1:Nx
        Xc = X;
        Xc(j) = Xc(j)+1i*h;
        J(:,j) = imag(funcao(Xc))/h;
    end
end
