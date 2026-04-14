function [Vmin, Vmax, Vestol] = limites_envelope(H, gamma)
    %dados da aeronave:
    m = 33100; g = 9.8;
    S = 88;
    CD0 = 0.015;
    K = 0.05;
    CLmax = 2.0;
    
    % modelo propulsivo
    Tmax_SL = 55600; %Newtons
    n_rho = 0.6;
    
    % condicao de voo que
    % que iremos estudar
    % inicialmente
    rho = atmosfera(H);
    
    Vestol = sqrt(2*m*g/(rho*S*CLmax));
    % cálculo das velocidades máxima e mínima
    % podemos resolver a seguinte equacao:
    % Fdisp = Tmax_SL*(rho/1.225)^n_rho = F = 0.5*rho*V^2*S*CD
    
    Vmax_min = roots([0.5*rho*S*CD0, 0, -Tmax_SL*(rho/1.225)^n_rho, 0, 2*K*(m*g)^2/(rho*S)])
    Vmax_min = Vmax_min(Vmax_min >0)
    Vmax = max(Vmax_min)
    Vmin = min(Vmax_min)
    
end