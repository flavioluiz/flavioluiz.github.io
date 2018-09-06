%definir as variváveis utilizadas simbolicamente
syms x x_dot theta theta_dot;
syms p_x p_theta;
syms m1 m2 l g x0 k;

% definir energia cinética e potencial
T = m1* x_dot^2/2 + (m2/2) * (x_dot^2 + 2*x_dot*l*theta_dot * cos(theta) + l^2 *theta_dot^2);
V = k * (x-x0)^2/2 - m2*g*l*cos(theta);

% determinar o Lagrangeano:
L = T - V;

% determinar os momentos generalizados
ptheta = diff(L, theta_dot);
px = diff(L, x_dot);

% determinar as velocidades generalizas em função dos momentos
% generalizados
solucao = solve(p_x-px, p_theta-ptheta, x_dot, theta_dot);

% determinar o Hamiltoniano
H = subs(T+V, solucao);

% determinar as derivadas parciais do Hamiltoniano em relação as
% coordenadas e momentos generalizados
dHdx = diff(H, x);
dHdtheta = diff(H, theta);
dHdpx = diff(H, p_x);
dHdptheta = diff(H, p_theta);

%% determinar as equacoes do movimento
syms t;
X_dot = [dHdpx; dHdptheta; -dHdx; -dHdtheta];

% transformar as constantes em valores numéricos:
X_dot = subs(X_dot, [g,k,l,m1,m2,x0], [1,1,3,1,1,1]);

% gerar um código com a dinâmica do problema
matlabFunction(X_dot,'File','dinamica','Vars',{t,[x; theta; p_x; p_theta]});

%simular o problema
TI = 0;
TF = 10;
X0 = [2; 0; 0; 0];
[T X] = ode45(@dinamica, [TI TF], X0);
figure;
subplot(2,1,1)
plot(T, X(:,1)); xlabel('tempo'); ylabel('x');
subplot(2,1,2);
plot(T, X(:,2)); xlabel('tempo'); ylabel('theta');