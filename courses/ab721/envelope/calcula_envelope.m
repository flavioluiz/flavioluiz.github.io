
% calculo do envelope de voo a partir da funcao
% limites_envelope(H)

H_vec = linspace(0,15700,100);
Vmin_vec = zeros(size(H_vec));
Vmax_vec = zeros(size(H_vec));
Vestol_vec = zeros(size(H_vec));

for i = 1:length(H_vec)
    [Vmin, Vmax, Vestol] = limites_envelope(H_vec(i));
    Vmin_vec(i) = Vmin;
    Vmax_vec(i) = Vmax;
    Vestol_vec(i) = Vestol;
end
% identificando os resultados com solucao real:
indices_reais = imag(Vmin_vec)==0;
% filtrando para apresentar apenas esses resultados:
Vmin_vec = Vmin_vec(indices_reais);
Vmax_vec = Vmax_vec(indices_reais);
Vestol_vec = Vestol_vec(indices_reais);
H_vec = H_vec(indices_reais);
figure;
plot(Vmin_vec, H_vec); hold on;
plot(Vmax_vec, H_vec);
plot(Vestol_vec, H_vec);