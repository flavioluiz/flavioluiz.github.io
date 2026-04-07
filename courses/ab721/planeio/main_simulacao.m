
% simular o planeio usando ODE45
%[T_vetor, X_matriz] = ode45(@dinamica,[0 Tfinal], X0, [], CL)

Tfinal = 4000; %tempo de simulação
m = 390; S = 16; g = 9.8;
H0 = 2000;
rho = atmosfera(H0);
K = 0.025; Cd0 = 0.015;
CL_vec = 0.3:0.05:1.8
i = 1;
for CL = CL_vec
    %CL = sqrt(Cd0/K);
    CD = Cd0 + K*CL^2;
    V0 = sqrt(2*m*g/(rho*S))*1/(CL^2+CD^2)^0.25;
    gamma0_rad = -atan(CD/CL);
    x0 = 0;
    X0 = [V0; rad2deg(gamma0_rad); H0; x0];
    [T_vetor, X_matriz] = ode45(@(t,X)dinamica(t,X,CL),[0 Tfinal], X0);

% 
% figure;
% subplot(411)
% plot(T_vetor, X_matriz(:,1));
% xlabel('tempo (s)');
% ylabel('Velocidade (m/s)')
% subplot(412)
% plot(T_vetor, X_matriz(:,2))
% xlabel('tempo (s)');
% ylabel('Gamma (deg)')
% subplot(413)
% plot(T_vetor, X_matriz(:,3))
% xlabel('tempo (s)');
% ylabel('Altitude (m)')
% subplot(414)
% plot(T_vetor, X_matriz(:,4))
% xlabel('tempo (s)');
% ylabel('Posicao horizontal (m)')


autonomia_voo_s = interp1(X_matriz(:,3), T_vetor,0);
alcance_m = interp1(T_vetor, X_matriz(:,4), autonomia_voo_s);

alcance_analitico_m = H0 * CL/CD;
alcance_vec(i) = alcance_m;
autonomia_vec(i) = autonomia_voo_s;
i = i+1;
end
%%
figure;
plot(CL_vec, autonomia_vec);
