function J = lineariza(funcao, X)
    % funcao é uma funcao de X, que retorna Y = funcao(X)
    % precisamos implementar um jacobiano de funcao(X)
    % X é um vetor (qual o tamanho?)
    Nx = length(X);
    % queremos linearizar em torno de "X"
    % funcao pode ser um vetor (qual o tamanho?)
    Ny = length(funcao(X));
    h = 1e-6;
    J = zeros(Ny, Nx);
    for i = 1:Nx % vamos calcular a derivada coluna por coluna
        delta = zeros(size(X));
        delta(i) = h;
        J(:,i) = (funcao(X+delta)-funcao(X-delta))/(2*h);
    end
end