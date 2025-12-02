% definição do modelo (massa-mola-amortecedor)
A = [-0.1 -1;
    1 0];
B = [1;0];

damp(A)
Q = [1 0; 0 1];
R = 1;

K = lqr(A,B,Q,R)
% Define the closed-loop system
Ac = A - B * K;
damp(Ac)
% 
x0 = [1; 0];        % condição inicial

tspan = linspace(0,10,501);

% --- Sem realimentação (malha aberta) ---
dx = @(t,x) A*x;                          % sem entrada
[ta, xa] = ode45(dx, tspan, x0);

% --- Com realimentação de estados (u = -K*x) ---
                               % exemplo de ganho de realimentação
Acl = A - B*K;
dx_cl = @(t,x) Acl*x;
[tc, xc] = ode45(dx_cl, tspan, x0);

% --- Plots ---
figure;
subplot(2,1,1);
plot(ta, xa(:,1), 'b', tc, xc(:,1), 'r--', 'LineWidth',1.2);
legend('x1 - sem realim.','x1 - com realim.','Location','best');
xlabel('t'); ylabel('x1'); grid on;
title('Resposta do estado x1');

subplot(2,1,2);
plot(ta, xa(:,2), 'b', tc, xc(:,2), 'r--', 'LineWidth',1.2);
legend('x2 - sem realim.','x2 - com realim.','Location','best');
xlabel('t'); ylabel('x2'); grid on;
title('Resposta do estado x2');