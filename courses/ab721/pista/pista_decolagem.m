% como calcular a distancia em pista
% para aeronave ir de v = 0 até v_LOF???

% podemos escrever como uma EDO:
% dS/dV = (m*V)/(T - D - mu * (W *cos(phi) - L) - W*sin(phi)
% e resolver a EDO, com condicao inicial S = 0, V = 0, e integrar até
% V = VLOF (onde VLOF é a velocidade de decolagem, tipicamente
% definida por requisito, como uma velocidade acima da Vestol).

T =  55600; %N
S = 88; % m2
rho = 1.225; 
mu_rolamento = 0.02; % rolamento/aceleracao
mu_frenagem = 0.35; % frenagem/rejeição da decolagem
Cd0 = 0.03;
K = 0.07;
CLmax = 2.5;
%CL de decolagem???
CL = 0.3; % inventei qualquer coisa
g = 9.8;
m = 33100;
W = m*g;
CD = Cd0+K*CL^2;
mu = mu_rolamento;
D = @(V) 0.5*rho*V.^2*S*CD;
phi = 0; % angulo de inclinacao da pista
L = @(V) 0.5*rho*V.^2*S*CL;
dSdV = @(V) (m*V)./(T - D(V) - mu * (W *cos(phi) - L(V))- W*sin(phi)) ;

Vestol = sqrt(2*W/(rho*S*CLmax));
VLOF = 1.2*Vestol;
% cálculo da integral de dSdV de V = 0 até V = VLOF
% usar algum integrador: ode45, trapz, integral, etc...
%tres maneiras de calcular:
% método dos trapézios:
V_vec = linspace(0,VLOF, 100);
S_pista_trapz = trapz(V_vec, dSdV(V_vec));

% funcao integral
S_pista = integral(dSdV, 0, VLOF)

% integracao da ODE / Runge-Kutta:
[V_vec, S_vec] = ode45(@(V,S) dSdV(V), [0 VLOF], 0);
S_pista_ode = S_vec(end)
figure;
plot(V_vec, S_vec)
