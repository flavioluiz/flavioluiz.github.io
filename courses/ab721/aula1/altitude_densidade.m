R = 287.05;
% dada altitude-pressao e temperatura (ou DeltaT_ISA)
% qual a pressão do ar?
altitude_pressao = 1000; %m
deltaT_ISA = 15; %15 graus acima do ISA
[rho_ISA, Pressao, temperatura_ISA] = atmosfera(altitude_pressao)
% qual a temperatura?
temperatura = temperatura_ISA + deltaT_ISA;
% qual a densidade do ar?
rho = Pressao/(R*temperatura)
% qual a altitude-densidade?
altitude_den = fzero( @(H) atmosfera(H) - rho, 0)