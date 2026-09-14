%% AS-765 — L1 — roteiro inicial para o Problema 2
% Complete os trechos indicados por TODO. O arquivo deve continuar legivel e
% executavel do inicio ao fim depois de preenchido.

clear;
close all;
clc;

%% Parametros e ponto nominal
m = 2;
ell = 0.5;
b = 0.25;
grav = 10;

theta_bar = pi/6;
omega_bar = 0;
xbar = [theta_bar;omega_bar];

% TODO: determine o torque nominal a partir da condicao de equilibrio.
% tau_bar = ...;

% TODO: implemente as funcoes f(x,tau) e g(x,tau) deduzidas no Problema 1.
% f = @(x,tau) [...; ...];
% g = @(x,tau) [...; ...];

%% 2a — Residuo de equilibrio e Jacobianas
% TODO: calcule e apresente o residuo antes de calcular as derivadas.
% res_eq = norm(f(xbar,tau_bar),inf);

% Uma possibilidade e reunir estado e entrada em z=[x;tau]:
% zbar = [xbar;tau_bar];
% fz = @(z) f(z(1:2),z(3));
% J_central = jac_central(fz,zbar);
% J_complex = jac_complex(fz,zbar);
%
% TODO: repita a derivacao numerica com g, separe A, B, C e D, compare com a
% referencia analitica e monte a tabela de erros para [A B] e [C D]. Nao
% confunda max(abs(E(:))) com a norma matricial induzida.

%% 2b — Resto de Taylor
alpha = 10.^(-(0:5));
px = [pi/18;1];
pu = 1;
escala_f = [1;20];

% TODO: calcule r(alpha), E_r(alpha), faca o grafico log--log e estime a
% inclinacao na faixa em que nao predomina o arredondamento.
%
% Sugestao para a inclinacao:
% coef = polyfit(log10(alpha(indices)),log10(E_r(indices)),1);
% inclinacao = coef(1);

%% 2c — Comparacao das respostas no tempo
tgrid = linspace(0,5,2001);
degraus_tau = [0.25,2.0];
opcoes = odeset('RelTol',1e-9,'AbsTol',1e-11);

% TODO: para cada degrau, integre os dois modelos com ode45.
%
% Modelo nao linear, em variaveis absolutas:
% [t_nl,x_nl] = ode45(@(~,x) f(x,tau_bar+delta_tau), ...
%                     tgrid,xbar,opcoes);
%
% Modelo linear, em variaveis de desvio:
% [t_li,dx_li] = ode45(@(~,dx) A*dx+B*delta_tau, ...
%                     tgrid,[0;0],opcoes);
%
% TODO: reconstrua theta_lin, calcule E_theta, gere as figuras e justifique a
% decisao com base no limite de 5%.

disp('Roteiro carregado. Complete os trechos TODO antes da entrega.');

%% Funcoes auxiliares fornecidas
function J = jac_central(fun,z)
%JAC_CENTRAL Jacobiana por diferencas finitas centradas e passo relativo.
f0 = fun(z);
J = zeros(numel(f0),numel(z));
eta = eps^(1/3);

for j = 1:numel(z)
    hj = eta*max(1,abs(z(j)));
    dz = zeros(size(z));
    dz(j) = hj;
    J(:,j) = (fun(z+dz)-fun(z-dz))/(2*hj);
end
end

function J = jac_complex(fun,z)
%JAC_COMPLEX Requer cadeia analitica que preserve a parte imaginaria.
f0 = fun(z);
J = zeros(numel(f0),numel(z));
h = 1e-20;

for j = 1:numel(z)
    dz = complex(zeros(size(z)));
    dz(j) = 1i*h;
    J(:,j) = imag(fun(z+dz))/h;
end
end
