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

> 🗓️ **Andamento efetivo em 21/08/2026:** a Aula 04 foi concluída hoje e a Aula 05 foi iniciada. A turma está um pouco atrás do cronograma previsto. As indicações abaixo registram o andamento real; o plano da disciplina permanece como cronograma de referência.

### **AULA 01** — realizada em 04/08/2026 — Introdução e Modelagem Mecânica

**Conteúdo**:
- objetivos, organização e metodologia da disciplina;
- sistemas de controle em malha aberta e fechada;
- modelagem de sistemas mecânicos;
- conversão de uma EDO de ordem \(N\) em \(N\) EDOs de primeira ordem.

**Material**:
- 📊 [Slides — Aula 01 (PDF)](../courses/MVO20/2026/slides-aula01-04-08-2026.pdf)

---

### **AULA 02** — realizada em 07/08/2026 — Modelagem Elétrica e Eletromecânica

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

### **AULA 03** — realizada em 11/08/2026 — Pontos de Operação e Linearização Analítica

**Conteúdo**:
- pontos de operação, equilíbrios e trajetórias nominais;
- expansão de Taylor e variáveis de desvio;
- matrizes Jacobianas \(A\), \(B\), \(C\) e \(D\);
- linearização de um tanque, de um pêndulo e de um motor CC com carga não linear;
- interpretação e validade local do modelo linearizado.

**Material**:
- 📊 [Slides — Aula 03 (PDF)](../courses/MVO20/2026/slides-aula03-11-08-2026.pdf)

---

### **AULA 04** — concluída em 21/08/2026 — Linearização Numérica e Validação

**Situação:** concluída em 21/08/2026.

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

### **AULA 05** — iniciada em 21/08/2026; em andamento — Transformada de Laplace e Solução de EDOs

**Situação:** iniciada ao final do encontro de 21/08/2026; o conteúdo abaixo ainda está em andamento.

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

### **AULA 06** — ainda não ministrada — Transformada Inversa e Funções de Transferência

**Situação:** material disponível antecipadamente; conteúdo ainda não ministrado.

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

Os materiais das próximas aulas serão acrescentados ao longo do semestre.

*Última atualização: 21/08/2026*
