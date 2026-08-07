function Xdot = dinamica(t, X, F, p)
% p é uma struct de parametros do sistema, declarado no main.m
m = p.m; k = p.k; c = p.c; xbar = p.xbar;

% sistema de equacoes de primeira ordem
% representando sistema massa-mola-amortecedor
    x = X(1);
    v = X(2);
    Xdot(1,1) = v;
    Xdot(2,1) = -k/m * (x-xbar) -c/m * v + F/m;

end
