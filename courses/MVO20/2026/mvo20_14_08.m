

% definindo dinamica para ser simulada:
A = 1; %m2
k = 1;
q_bar = 1;
delta_q = 0;
q = q_bar + delta_q; %m3/s
dinamica = @(t,h) q/A - k*sqrt(h)/A;

h_bar = (q_bar/k)^2;
dinamica_linear = @(t, delta_h) -k/(2*A*sqrt(h_bar)) * delta_h + 1/A * delta_q; 

delta_h0 = 0.1;
h0 = h_bar + delta_h0; %m
% integracao usando ode45
[Tvec hvec] = ode45(dinamica, [0 20], h0);

% integracao da equacao linearizada
[Tvec_lin delta_hvec_lin] = ode45(dinamica_linear, [0 20], delta_h0);

figure;
plot(Tvec,hvec); hold all;
plot(Tvec_lin, delta_hvec_lin + h_bar)
xlabel('tempo (s)');
ylabel('altura (m)');
legend('nao linear', 'linear')