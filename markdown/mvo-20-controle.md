# MVO-20: Controle I

**Cursos de graduação em Engenharia Aeronáutica e Engenharia Aeroespacial**<br>
**Instituto Tecnológico de Aeronáutica (ITA)**

> A disciplina é oferecida conjuntamente com **AB-110**, disciplina de 2 créditos da pós-graduação. As aulas e o material didático são comuns às duas turmas.

## Informações do Curso

- **Período**: 2º semestre de 2026
- **Horários**: terças-feiras, das 08h00 às 09h50; sextas-feiras, das 10h10 às 12h00
- **Carga horária no calendário**: 60 horas-aula
- **Docente**: Prof. Flávio Luiz Cardoso Ribeiro
- **Material**: slides, exemplos MATLAB/Simulink, listas de exercícios e atividades computacionais

📋 **[Plano da Disciplina MVO-20 — 2026 (PDF)](../courses/MVO20/2026/plano-disciplina-mvo20-2026.pdf)**

## Avaliação

> 📌 **Prova 1:** presencial, em **22/09/2026**, das **10h00 às 12h00**.

- **1º bimestre**: listas de exercícios (30%) e avaliação escrita presencial (70%); prova em 22/09/2026, das 10h00 às 12h00.
- **2º bimestre**: listas de exercícios (30%) e avaliação escrita (70%); prova prevista para 17/11/2026, data a confirmar.
- **Exame final**: prova escrita, em data a confirmar conforme o calendário acadêmico.
- **Média final**: média aritmética da média do primeiro bimestre, da média do segundo bimestre e do exame final.

## Cronograma e Material das Aulas

> 🗓️ **Andamento efetivo em 17/09/2026:** os conteúdos das Aulas 01–12 já foram ministrados. A Aula 13, dedicada ao critério de Routh–Hurwitz, está prevista para 18/09. A Prova 1 será realizada em 22/09.

### **AULA 01** — iniciada em 04/08/2026; concluída em 07/08/2026 — Introdução e Modelagem Mecânica

**Conteúdo**:
- objetivos, organização e metodologia da disciplina;
- sistemas de controle em malha aberta e fechada;
- modelagem de sistemas mecânicos;
- conversão de uma EDO de ordem \(N\) em \(N\) EDOs de primeira ordem.

**Material**:
- 📊 [Slides — Aula 01 (PDF)](../courses/MVO20/2026/slides-aula01-04-08-2026.pdf)

---

### **AULA 02** — iniciada em 11/08/2026; concluída em 14/08/2026 — Modelagem Elétrica e Eletromecânica

**Conteúdo**:
- modelagem de circuitos RC e RLC;
- motor de corrente contínua;
- entradas, perturbações, estados e saídas;
- representação de EDOs de ordem elevada como sistemas de primeira ordem;
- simulação de modelos dinâmicos com `ode45`.

**Material**:
- 📊 [Slides — Aula 02 (PDF)](../courses/MVO20/2026/slides-aula02-07-08-2026.pdf)
- 💻 [Exemplo MATLAB — motor CC com `ode45`](../courses/MVO20/2026/motor_cc_ode45.m)
- 💻 **MATLAB 1 — apresentado em aula em 07/08/2026**: [programa principal (`main.m`)](../courses/MVO20/2026/matlab1/main.m) e [modelo dinâmico (`dinamica.m`)](../courses/MVO20/2026/matlab1/dinamica.m)

---

### **AULA 03** — iniciada em 14/08/2026; concluída em 18/08/2026 — Pontos de Operação e Linearização Analítica

**Conteúdo**:
- pontos de operação, equilíbrios e trajetórias nominais;
- expansão de Taylor e variáveis de desvio;
- matrizes Jacobianas \(A\), \(B\), \(C\) e \(D\);
- linearização de um tanque, de um pêndulo e de um motor CC com carga não linear;
- interpretação e validade local do modelo linearizado.

**Material**:
- 📊 [Slides — Aula 03 (PDF)](../courses/MVO20/2026/slides-aula03-11-08-2026.pdf)

---

### **AULA 04** — iniciada em 18/08/2026; concluída em 21/08/2026 — Linearização Numérica e Validação

> ⚠️ **Slides atualizados:** o PDF desta aula foi revisado para empregar diretamente a função `lineariza.m` no cálculo independente das Jacobianas $A$ e $B$. Se você baixou a versão anterior, faça um novo download.

**Conteúdo**:
- função genérica **lineariza** para o cálculo numérico de Jacobianas;
- obtenção direta das matrizes \(A\) e \(B\) com chamadas independentes;
- diferenças finitas progressivas e centradas;
- escolha do passo e escalonamento das variáveis;
- método *complex step* e suas limitações;
- comparação entre linearizações analítica e numérica;
- linearização e simulação do tanque e do pêndulo;
- validação pelo resto de Taylor e por simulação no tempo.

**Material**:
- 📊 [Slides revisados — Aula 04 (PDF)](../courses/MVO20/2026/slides-aula04-14-08-2026.pdf)

> 💻 **Os quatro códigos abaixo foram feitos em sala com os alunos:**

- 💻 [Função MATLAB lineariza.m — Jacobiana por diferenças centradas](../courses/MVO20/2026/lineariza.m)
- 💻 [Linearização e simulação do pêndulo](../courses/MVO20/2026/linearizacao_pendulo.m)
- 💻 [Código do pêndulo feito em aula — mvo20_14_08_pendulo.m](../courses/MVO20/2026/mvo20_14_08_pendulo.m)
- 💻 [Código do tanque feito em aula — mvo20_14_08.m](../courses/MVO20/2026/mvo20_14_08.m)
- 💻 [Roteiro complementar — precisão numérica e validação](../courses/MVO20/2026/linearizacao_numerica.m)

---

### **AULA 05** — ministrada — Transformada de Laplace e Solução de EDOs

**Conteúdo**:
- definição unilateral e região de convergência;
- pares básicos e propriedades da transformada de Laplace;
- transformação de derivadas com condições iniciais;
- solução sistemática de EDOs de primeira e segunda ordem;
- separação entre resposta de entrada e memória inicial;
- teoremas dos valores inicial e final e verificação no MATLAB.

**Material**:
- 📊 [Slides — Aula 05 (PDF)](../courses/MVO20/2026/slides-aula05-18-08-2026.pdf)

---

### **AULA 06** — ministrada — Transformada Inversa e Funções de Transferência

**Conteúdo**:
- transformada inversa e decomposição em frações parciais;
- polos reais distintos, repetidos e pares complexos;
- obtenção de funções de transferência a partir de EDOs;
- obtenção de $G(s)$ a partir do espaço de estados;
- exemplos do massa–mola–amortecedor, motor CC e pêndulo linearizado;
- respostas ao impulso e ao degrau e verificação no MATLAB.

**Material**:
- 📊 [Slides — Aula 06 (PDF)](../courses/MVO20/2026/slides-aula06-21-08-2026.pdf)

---

### **AULAS 07–08** — ministradas — Polos, Zeros e Diagramas de Blocos

**Conteúdo**:
- identificação de polos e zeros e sua relação com os modos temporais;
- leitura geométrica dos polos no plano $s$;
- efeito dos zeros, respostas inversas e cancelamentos polo–zero;
- estabilidade BIBO do canal e distinção em relação à estabilidade interna;
- tradução de equações em diagramas de blocos;
- associações em série, paralelo e realimentação;
- relações entrada–saída e polos de malha fechada.

**Material**:
- 📊 [Slides — Aulas 07–08 (PDF)](../courses/MVO20/2026/slides-aulas07-08-28-08-01-09-2026.pdf)

---

### **AULA 09** — ministrada — Sistemas de Primeira Ordem e Aproximações

**Conteúdo**:
- forma canônica $K/(Ts+1)$ e interpretação de ganho e constante de tempo;
- resposta ao degrau e índices de subida e acomodação;
- identificação de $K$ e $T$ a partir de uma resposta medida;
- respostas a impulso e rampa;
- aproximação de sistemas de ordem elevada por um polo dominante;
- separação de escalas, resíduos, zeros e validação do modelo reduzido.

**Material**:
- 📊 [Slides — Aula 09 (PDF)](../courses/MVO20/2026/slides-aula09-04-09-2026.pdf)

---

### **AULA 10** — iniciada em 08/09/2026; concluída em 11/09/2026 — Segunda Ordem, Especificações e Dinâmica Dominante

**Situação:** os primeiros tópicos foram apresentados em 08/09/2026, e o material foi concluído em 11/09/2026.

**Conteúdo**:
- forma canônica de segunda ordem e geometria dos polos;
- papéis de $\zeta$, $\omega_n$ e $\omega_d$;
- sobresinal, tempos de pico, subida e acomodação;
- tradução de especificações transitórias em regiões no plano $s$;
- aproximação por um par dominante de segunda ordem;
- preservação do ganho DC e validação por resíduos, curvas e índices.

**Material**:
- 📊 [Slides — Aula 10 (PDF)](../courses/MVO20/2026/slides-aula10-08-09-2026.pdf)

---

### **AULA 11** — ministrada em 11/09/2026 — Erro Estacionário, Tipo do Sistema e Desempenho em Malha Fechada

**Situação:** material apresentado após a conclusão da Aula 10.

**Conteúdo**:
- erro no somador e erro de rastreamento;
- sensibilidade e sensibilidade complementar;
- uso correto do teorema do valor final;
- tipo do sistema e constantes de erro de posição, velocidade e aceleração;
- erro estacionário para entradas degrau, rampa e parábola;
- efeito de perturbações, ganho de malha e ação integral;
- verificação dos resultados no MATLAB.

**Material**:
- 📊 [Slides — Aula 11 (PDF)](../courses/MVO20/2026/slides-aula11-11-09-2026.pdf)

---

### **AULA 12** — ministrada em 15/09/2026 — Estabilidade, Localização dos Polos e Equação Característica

**Situação:** material apresentado conforme o calendário previsto.

**Conteúdo**:
- estabilidade BIBO e condição de integrabilidade da resposta ao impulso;
- interpretação dos modos e dos polos no plano $s$;
- polos na origem, polos imaginários e multiplicidade;
- distinções entre estabilidade BIBO, interna e de Lyapunov;
- equação característica de sistemas realimentados;
- fronteiras e intervalos de estabilidade em função do ganho;
- relação entre polos da função de transferência e autovalores da realização.

**Material**:
- 📊 [Slides — Aula 12 (PDF)](../courses/MVO20/2026/slides-aula12-15-09-2026.pdf)

---

### **AULA 13** — prevista para 18/09/2026 — Critério de Routh–Hurwitz e Aplicações

**Situação:** material disponível; aula mantida para 18/09/2026, conforme o calendário previsto.

**Conteúdo**:
- construção e interpretação da tabela de Routh;
- contagem de raízes no semiplano direito sem calcular explicitamente os polos;
- condições e intervalos de estabilidade para sistemas com parâmetros;
- tratamento dos casos especiais do critério;
- estabilidade relativa por deslocamento do eixo;
- verificação numérica no MATLAB.

**Material**:
- 📊 [Slides — Aula 13 (PDF)](../courses/MVO20/2026/slides-aula13-18-09-2026.pdf)

---

### **PROVA 1** — 22/09/2026, das 10h00 às 12h00

Avaliação escrita presencial do primeiro bimestre.

**Material de preparação**:
- 📝 [Lista de preparação para a P1 (PDF)](../courses/MVO20/2026/lista-preparacao-p1-2026.pdf)
- ✅ [Gabarito da lista de preparação para a P1 (PDF)](../courses/MVO20/2026/gabarito-lista-preparacao-p1-2026.pdf)

### **FECHAMENTO DO 1º BIMESTRE** — previsto para 25/09/2026

Correção comentada da avaliação e fechamento do primeiro bimestre, conforme o plano da disciplina.

---

Os materiais das aulas seguintes serão acrescentados ao longo do semestre, de acordo com o calendário previsto.

*Última atualização: 17/09/2026*
