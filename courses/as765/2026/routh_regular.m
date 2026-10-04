function [R,nSPD] = routh_regular(coeffs)
%ROUTH_REGULAR Tabela numerica de Routh, apenas sem casos especiais.
% [R,nSPD] = routh_regular([an ... a0])
% Interrompe em linha/pivo numericamente nulo; nao decide casos de fronteira.
validateattributes(coeffs,{'numeric'},{'vector','real','finite','nonempty'});
a = double(coeffs(:).');
if numel(a)<2 || a(1)==0
    error('AS765:Entrada','Forneca grau >= 1 e coeficiente lider nao nulo.');
end
a = a/a(1);
n = numel(a); m = ceil(n/2); R = zeros(n,m);
R(1,1:numel(a(1:2:end))) = a(1:2:end);
R(2,1:numel(a(2:2:end))) = a(2:2:end);
for i = 2:n
    scale = max(1,max(abs(R(i,:))));
    if abs(R(i,1)) <= 1e-12*scale
        error('AS765:CasoEspecial', ...
            'Pivo/linha numericamente nulo na linha s^%d. Trate analiticamente.',n-i);
    end
    if i<n
        for j=1:m-1
            R(i+1,j)=(R(i,1)*R(i-1,j+1)-R(i-1,1)*R(i,j+1))/R(i,1);
        end
        if any(~isfinite(R(i+1,:)))
            error('AS765:Escala','Falha numerica: reveja a escala dos coeficientes.');
        end
    end
end
nSPD = sum(R(1:end-1,1).*R(2:end,1)<0);
end
