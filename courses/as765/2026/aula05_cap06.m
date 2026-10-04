%% AS-765, aula 5, capitulo 6, 05/10/2026
% Requer Control System Toolbox. Executar com routh_regular.m na mesma pasta.
clear; close all; clc
codeDir = fileparts(mfilename('fullpath')); addpath(codeDir);
base = codeDir; [~,name] = fileparts(base);
if strcmp(name,'matlab'), base = fileparts(base); end
figdir = fullfile(base,'Figuras');
if ~exist(figdir,'dir'), mkdir(figdir); end
set(groot,'defaultAxesFontSize',18,'defaultLegendFontSize',15, ...
    'defaultLineLineWidth',1.8, ...
    'defaultAxesColorOrder',[35 82 124;170 55 55;45 115 65]/255);
s=tf('s'); tol=1e-8;

%% 1. Ressonancia: resposta correta a sin(t)
G = 1/(s^2+1); t=(0:0.001:20)';
y = lsim(G,sin(t),t);
yExata = 0.5*(sin(t)-t.*cos(t));
assert(max(abs(y-yExata))<1e-5);
assert(max(abs(step(G,t)-(1-cos(t))))<tol);
f=figure('Position',[100 100 900 330]);
plot(t,sin(t),'--',t,yExata); grid on
xlabel('Tempo (s)'); ylabel('Amplitude');
legend('Entrada sin(t)','Saida','Location','northwest');
set(findall(f,'Type','axes'),'Toolbar',[]);
exportgraphics(f,fullfile(figdir,'ressonancia.pdf'),'ContentType','vector');

%% 2. Estabilidade interna e modos ocultos
A=[0 1;-2 -3]; assert(max(abs(sort(eig(A))-[-2;-1]))<tol);
Ah=diag([-1 2]); Sh=ss(Ah,[1;0],[1 1],0);
Gh=minreal(tf(Sh));
assert(~isstable(Sh) && isstable(Gh));
t0=(0:0.01:3)'; yh=initial(Sh,[0;1],t0);
assert(max(abs(yh-exp(2*t0)))<1e-8);
A0=zeros(2); Aj=[0 1;0 0];
assert(norm(expm(A0*2)-eye(2))<tol);
assert(norm(expm(Aj*2)-[1 2;0 1])<tol);

%% 3. Tabelas regulares e conferencias independentes por roots
polys = {[1 3 2 1],[1 1 2 8],[1 3 2 8],[1 4 6 4 6]};
counts = [0 2 2 2];
for i=1:numel(polys)
    [R,nSPD]=routh_regular(polys{i});
    p=roots(polys{i});
    assert(nSPD==counts(i) && nSPD==sum(real(p)>tol));
    disp('Coeficientes, tabela e raizes:'); disp(polys{i});disp(R);disp(p)
end
[R,nSPD]=routh_regular([1 3 2 1]);
assert(norm(R-[1 2;3 1;5/3 0;1 0])<tol && nSPD==0);
[Rneg,nneg]=routh_regular(-[1 3 2 1]);
assert(norm(Rneg-R)<tol && nneg==0);
[Rlin,nlin]=routh_regular([1 2]); assert(isequal(Rlin,[1;2]) && nlin==0);

%% 4. Casos especiais: formulas exatas, roots como conferencia
% Pivo zero isolado: linha s^2 [0 5].
% Em eps->0+, primeira coluna [1 2 eps (6*eps-10)/eps 5].
qPivo=[1 2 3 6 5];
assert(sum(real(roots(qPivo))>tol)==2);
% Linha inteira nula, auxiliar 2*s^2+8 e derivada 4*s.
qEixo=[1 2 4 8];
assert(isequal(conv([1 2],[1 0 4]),qEixo));
assert(sum(abs(real(roots(qEixo)))<tol)==2);
% Linha nula com par real simetrico: auxiliar 2*s^2-2.
qSim=[1 2 -1 -2];
assert(isequal(conv([1 2],[1 0 -1]),qSim));
assert(sum(real(roots(qSim))>tol)==1);
% A funcao didatica deve recusar todos esses casos, inclusive raiz em zero.
for q={qPivo,qEixo,qSim,[1 3 2 0]}
    recusou=false;
    try
        routh_regular(q{1});
    catch err
        recusou=strcmp(err.identifier,'AS765:CasoEspecial');
    end
    assert(recusou,'Caso especial foi aceito indevidamente.');
end

%% 5. Faixa 0<K<6
P=1/(s*(s+1)*(s+2));
for K=[-1 0.1 1 5.9 6.1 8]
    [~,nSPD]=routh_regular([1 3 2 K]);
    p=roots([1 3 2 K]);
    assert(nSPD==sum(real(p)>tol));
    assert((nSPD==0)==(K>0 && K<6));
end
assert(isequal(conv([1 3],[1 0 2]),[1 3 2 6]));
t=(0:0.01:20)';
f=figure('Position',[100 100 950 490]); hold on
for K=[1 6 8]
    T=feedback(K*P,1); y=step(T,t);
    plot(t,y,'DisplayName',sprintf('K = %g',K));
end
grid on; xlabel('Tempo (s)'); ylabel('Saida ao degrau');
legend('Location','northwest');
set(findall(f,'Type','axes'),'Toolbar',[]);
exportgraphics(f,fullfile(figdir,'ganho.pdf'),'ContentType','vector');

%% 6. Exercicio: faixa 0<K<5 e fronteiras exatas
for K=[-1 0.1 1 4.9 5.1 6]
    [~,nSPD]=routh_regular([1 4 6 4 K]);
    assert(nSPD==sum(real(roots([1 4 6 4 K]))>tol));
    assert((nSPD==0)==(K>0 && K<5));
end
assert(isequal(conv([1 0 1],[1 4 5]),[1 4 6 4 5]));
assert(isequal(conv([1 2 0],[1 2 2]),[1 4 6 4 0]));
% Atividade curta: k=6 em s^3+2s^2+3s+k.
assert(isequal(conv([1 2],[1 0 3]),[1 2 3 6]));
fprintf('Todas as verificacoes do capitulo 6 passaram.\n');
