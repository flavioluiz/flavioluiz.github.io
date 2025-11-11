% parâmetros do carro
a = 0.0101; b = 1.3203;
g = 9.8;
ue = 0.1616; ve = 20;

% definição das condições desejadas em malha fechada, e cálculo dos ganhos:
kp = 0.5; ki = 0.4;

% dinâmica e controlador:
theta = @(t) 6* (t>=5) /180*pi;  % rampa
u = @(X) (kp * (ve-X(1)) + ki*X(2)); % controlador PI
u_sat = @(X) min(u(X),1); % saturacao do atuador

kt = 2;
% equacoes diferenciais da dinamica do carro:
%dinamica = @(t,X)[-a*(X(1)-ve) + b*(u_sat(X)-ue) - g*theta(t);
%           (ve-X(1)) + kt/ki * (u_sat(X)-u(X))];
%dinamica = @(t,X)[-a*(X(1)-ve) + b*(u_sat(X)-ue) - g*theta(t);
%           (ve-X(1)) ]; % sem protecao windup
%proposta nova: evitar que a contribuição do erro integral no atuador
%ultrapasse 1, parando de integrar se E>1/ki e e>0
dinamica = @(t,X)[-a*(X(1)-ve) + b*(u_sat(X)-ue) - g*theta(t);
           (X(2)<=1/ki)*(ve-X(1))  + (X(2)>1/ki)*(ve-X(1)<0) *(ve-X(1)) ];
% simulação:
[T,X] = ode23(dinamica, [0:0.1:65], [ve; ue/ki]);
figure;
subplot(211)
plot(T,X(:,1)-ve);
xlabel('tempo (s)');
ylabel('erro (v-ve) (m/s)');
subplot(212);
U_vec = zeros(size(T));
U_vec_sat = zeros(size(T));
for i = 1:length(T)
    U_vec(i) = u(X(i,:));
    U_vec_sat(i) = u_sat(X(i,:));
end
plot(T,U_vec, 'b-.'); hold on; plot(T,U_vec_sat, 'b-');
xlabel('tempo (s)');
ylabel('controle u');
legend('sinal comandado', 'sinal aplicado')

%%
figure;
plot(T,X(:,2)); 
