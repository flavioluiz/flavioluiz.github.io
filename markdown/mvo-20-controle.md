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

- **1º bimestre**: listas de exercícios (30%) e avaliação escrita (70%); prova prevista para 25/09/2026, data a confirmar.
- **2º bimestre**: listas de exercícios (30%) e avaliação escrita (70%); prova prevista para 17/11/2026, data a confirmar.
- **Exame final**: prova escrita, em data a confirmar conforme o calendário acadêmico.
- **Média final**: média aritmética da média do primeiro bimestre, da média do segundo bimestre e do exame final.

## Cronograma e Material das Aulas

### **AULA 01** — 04/08/2026 — Introdução e Modelagem Mecânica

**Conteúdo**:
- objetivos, organização e metodologia da disciplina;
- sistemas de controle em malha aberta e fechada;
- modelagem de sistemas mecânicos;
- conversão de uma EDO de ordem \(N\) em \(N\) EDOs de primeira ordem.

**Material**:
- 📊 [Slides — Aula 01 (PDF)](../courses/MVO20/2026/slides-aula01-04-08-2026.pdf)

---

### **AULA 02** — 07/08/2026 — Modelagem Elétrica e Eletromecânica

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

### **AULA 03** — 11/08/2026 — Pontos de Operação e Linearização Analítica

**Conteúdo**:
- pontos de operação, equilíbrios e trajetórias nominais;
- expansão de Taylor e variáveis de desvio;
- matrizes Jacobianas \(A\), \(B\), \(C\) e \(D\);
- linearização de um tanque, de um pêndulo e de um motor CC com carga não linear;
- interpretação e validade local do modelo linearizado.

**Material**:
- 📊 [Slides — Aula 03 (PDF)](../courses/MVO20/2026/slides-aula03-11-08-2026.pdf)

---

### **AULA 04** — 14/08/2026 — Linearização Numérica e Validação

**Conteúdo**:
- diferenças finitas progressivas e centradas;
- escolha do passo e escalonamento das variáveis;
- método *complex step* e suas limitações;
- comparação entre linearizações analítica e numérica;
- validação pelo resto de Taylor e por simulação no tempo.

**Material**:
- 📊 [Slides — Aula 04 (PDF)](../courses/MVO20/2026/slides-aula04-14-08-2026.pdf)
- 💻 [Roteiro MATLAB — linearização numérica e validação](../courses/MVO20/2026/linearizacao_numerica.m)

---

Os materiais das próximas aulas serão acrescentados ao longo do semestre.

*Última atualização: 07/08/2026*
