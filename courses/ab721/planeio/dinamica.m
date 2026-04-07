function [X_dot] = dinamica(t, X, CL)
    % Estados:
    V = X(1); gamma_deg = X(2); H = X(3); x = X(4);
    
    m = 390; %kg
    g = 9.8;
    K = 0.025;
    Cd0 = 0.015;
    S = 16;

    % rho = atmosfera(H)
    rho = atmosfera(H);
    
    % polar de arrasto:
    CD = Cd0 + K*CL^2;

    % Forcas aerodinamicas
    L = 0.5 * rho * V^2 * S * CL;
    D = 0.5 * rho * V^2 * S * CD;

    % equacoes dinamicas
    V_dot = (-D-m*g*sind(gamma_deg))/m;
    gamma_dot_rad_s = (L-m*g*cosd(gamma_deg))/(m*V);
    H_dot = V*sind(gamma_deg);
    x_dot = V*cosd(gamma_deg);
    
    X_dot = [V_dot;
             rad2deg(gamma_dot_rad_s);
             H_dot;
             x_dot];
end