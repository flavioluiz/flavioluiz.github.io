% Sistema
A = [-0.1 -1; 1 0];
B = [1;0];
x0 = [1;0];
tspan = linspace(0,10,501);

% Malha aberta (apenas para referência)
dx_ol = @(t,x) A*x;
[to, xo] = ode45(dx_ol, tspan, x0);

% Configurações LQR a testar
Qs = {eye(2)*1, eye(2)*100};
R = 1;

% Prealoca para plot
colors = {'r','g'}; linest = {'-','--'};
Ks = cell(size(Qs));
tcells = cell(size(Qs));
xcells = cell(size(Qs));
ucells = cell(size(Qs));

for i = 1:numel(Qs)
    Q = Qs{i};
    K = lqr(A,B,Q,R);
    Ks{i} = K;
    Ac = A - B*K;
    dx_cl = @(t,x) Ac*x;
    [tcl, xcl] = ode45(dx_cl, tspan, x0);
    % calcula u(t) = -K*x(t) nos pontos retornados
    ucl = -(K * xcl')';
    tcells{i} = tcl;
    xcells{i} = xcl;
    ucells{i} = ucl;
end

% --- Plota estados (todos no mesmo gráfico) ---
figure;
subplot(2,1,1);
plot(to, xo(:,1), 'k:', 'LineWidth',1); hold on;
for i=1:numel(Qs)
    plot(tcells{i}, xcells{i}(:,1), colors{i}, 'LineStyle', linest{i}, 'LineWidth',1.2);
end
legend_entries = ['x1 - aberta', arrayfun(@(i) sprintf('x1 - Q=%g', trace(Qs{i})), 1:numel(Qs), 'UniformOutput',false)];
legend(legend_entries, 'Location','best');
xlabel('t'); ylabel('x_1'); grid on;
title('Estado x_1');

subplot(2,1,2);
plot(to, xo(:,2), 'k:', 'LineWidth',1); hold on;
for i=1:numel(Qs)
    plot(tcells{i}, xcells{i}(:,2), colors{i}, 'LineStyle', linest{i}, 'LineWidth',1.2);
end
legend_entries = ['x2 - aberta', arrayfun(@(i) sprintf('x2 - Q=%g', trace(Qs{i})), 1:numel(Qs), 'UniformOutput',false)];
legend(legend_entries, 'Location','best');
xlabel('t'); ylabel('x_2'); grid on;
title('Estado x_2');

% --- Plota sinais de controle (cada caso em figura separada ou mesmo eixo) ---
figure;
plot(tcells{1}, ucells{1}(:,1), colors{1}, 'LineStyle', linest{1}, 'LineWidth',1.2); hold on;
plot(tcells{2}, ucells{2}(:,1), colors{2}, 'LineStyle', linest{2}, 'LineWidth',1.2);
legend(sprintf('u - Q=1 (K=[%g %g])', Ks{1}(1), Ks{1}(2)), sprintf('u - Q=100 (K=[%g %g])', Ks{2}(1), Ks{2}(2)), 'Location','best');
xlabel('t'); ylabel('u(t)'); grid on;
title('Sinal de controle u(t) para diferentes Q');

% Opcional: mostra ganhos calculados
disp('Ganho LQR para cada Q:');
for i=1:numel(Qs)
    fprintf('Q = %g: K = [%g  %g]\n', trace(Qs{i}), Ks{i});
end