% linearizacao numerica do pendulo


% definindo dinamica para ser simulada:
g = 9.8;
l = 1;
b = 1;
m = 1;

theta_eq_deg = 0;
theta_eq = deg2rad(theta_eq_deg);

u_eq = m*g*l*sin(theta_eq);

delta_X0 = [deg2rad(-1); 0];
delta_u = 0;
u = u_eq + delta_u;
% X = [theta; thetadot]
dinamica = @(t,X) [X(2);
                    -g/l*sin(X(1))-b/(m*l^2) * X(2) + 1/(m*l^2) * u];

A = [0, 1;
    -g/l*cos(theta_eq), -b/(m*l^2)]; damp(A)
B = [0;
    1/(m*l^2)];
dinamica_linear = @(t, delta_X) A * delta_X + B*delta_u; 


% integracao usando ode45
X0 = [theta_eq; 0] + delta_X0; %theta0;thetadot0;
[Tvec Xmatriz] = ode45(dinamica, [0 20], X0);

% integracao da equacao linearizada
[Tvec_lin Xmatriz_lin] = ode45(dinamica_linear, [0 20], delta_X0);

figure;
plot(Tvec,rad2deg(Xmatriz(:,1))); hold all;
plot(Tvec_lin, rad2deg(Xmatriz_lin(:,1)) + theta_eq_deg)
xlabel('tempo (s)');
ylabel('theta (deg)');
legend('nao linear', 'linear')