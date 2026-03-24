function [rho, Pressao, Temperatura, c] = atmosfera(altitude)
%ATMOSFERA Summary of this function goes here
%   Detailed explanation goes here
P0 = 101325; %Pa (pressao nivel do mar ISA);
T0 = 15; %Celsius Nivel do mar ISA
rho0 = 1.225; %kg/m3 nivel do mar ISA

R = 287.05; % J/(kg K)
g = 9.80665; % m/s2
gamma = 1.4;

if altitude <= 11000
    %perda de temperatura na troposfera
    dTdH = - 6.5e-3; % K/m ou ºC/m; 
    T_Celsius = T0 + dTdH * altitude;
    T_Kelvin = 273.15 + T_Celsius;
    T0_Kelvin = 273.15 + T0;
    
    Pressao = P0 * (T_Kelvin/T0_Kelvin)^(-g/(R*dTdH));
    rho = Pressao/ (R*T_Kelvin);
    Temperatura = T_Kelvin;
    
    c = sqrt(gamma*R*Temperatura);
elseif altitude <= 20000
    [rho11, Pressao11, T11] = atmosfera(11000);
    Temperatura = T11;
    Pressao = Pressao11 * exp(-g/(R*T11)*(altitude-11000));
    rho = Pressao/(R*Temperatura);
    c = sqrt(gamma*R*Temperatura);

else
    fprintf('altitude inválida > 20km');
    rho = []; Temperatura = []; Pressao = []; c = [];
end

end

