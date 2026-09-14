# AS-765: Sistemas de Controle — 2026

**Mestrado Profissional em Engenharia Aeronáutica — Turma 34**<br>
**Instituto Tecnológico de Aeronáutica (ITA)**

## Informações do curso

- **Período**: Fase 2 — 2º período de 2026
- **Horário regular**: segundas-feiras, das 13h30 às 17h30
- **Local**: ITA, sala 1403
- **Carga horária**: 48 horas-aula — 44 horas de conteúdo, exercícios e atividades computacionais; 4 horas de avaliação
- **Docente**: Prof. Flávio Luiz Cardoso Ribeiro
- **Encerramento do conteúdo**: 23/11/2026
- **Avaliação integradora**: 14/12/2026, com duração de quatro horas-aula

> 🗓️ Haverá aula em **28/09** e também na **quarta-feira, 07/10**. O encontro de 07/10 permite antecipar a sequência da disciplina; não haverá aula em **30/11**. O horário e a sala da quarta-feira serão confirmados no ambiente da disciplina.

📋 **[Plano da Disciplina AS-765 — 2026 (PDF)](../courses/as765/2026/plano-disciplina-as765-2026.pdf)**

## Avaliação

- **Quatro listas de exercícios em duplas (20%)**: quatro entregas, valendo 5% da nota final cada uma.
- **Oito quizzes individuais (20%)**: a nota dos quizzes será a média dos sete melhores resultados.
- **Avaliação escrita integradora (60%)**: prova individual e cumulativa em 14/12, com quatro horas-aula.

A nota final será calculada por

$$
NF=0{,}20L+0{,}20Q+0{,}60P,
$$

em que $L$ é a média das quatro listas, $Q$ é a média dos sete melhores resultados entre oito quizzes e $P$ é a nota da avaliação escrita integradora. A aprovação requer $NF\geq6{,}5$. O calendário definitivo das atividades será publicado no Google Classroom.

## Programação de quizzes e listas

Os horários e prazos publicados no Google Classroom são os definitivos.

### Quizzes individuais

| Quiz | Publicação | Encerramento | Conteúdo principal |
|---|:---:|:---:|---|
| Q1 | **14/09, publicado** | **21/09** | Modelagem e linearização |
| Q2 | 21/09, após a aula | 28/09 | Laplace, funções de transferência e diagramas de blocos |
| Q3 | 28/09, após a aula | 08/10 | Resposta temporal |
| Q4 | 06/10 | 15/10 | Estabilidade e critério de Routh-Hurwitz |
| Q5 | 19/10, após a aula | 26/10 | Diagramas de Bode e Nyquist |
| Q6 | 26/10, após a aula | 04/11 | Controladores P, PI, PD e PID |
| Q7 | 16/11, após a aula | 23/11 | Lugar das raízes, sensibilidade e compensadores |
| Q8 | 23/11, após a aula | 30/11 | Controle em espaço de estados e revisão integradora |

### Listas em dupla

| Lista | Publicação | Entrega | Conteúdo principal |
|---|:---:|:---:|---|
| L1 | **14/09, publicada** | **05/10** | Modelagem, linearização e transformada de Laplace |
| L2 | 06/10 | 18/10 | Funções de transferência, resposta temporal e estabilidade |
| L3 | 20/10 | 08/11 | Resposta em frequência, margens e critério de Nyquist |
| L4 | 17/11 | 06/12 | PID, lugar das raízes, sensibilidade e projeto de compensadores |

- 📄 **[Lista 1 - enunciado (PDF)](../courses/as765/2026/lista-01-modelagem-linearizacao-laplace.pdf)**
- 💻 **[Lista 1 - roteiro inicial MATLAB](../courses/as765/2026/l1-esqueleto.m)**

## Aulas e materiais publicados

Os cinco conjuntos de slides abaixo correspondem às três primeiras aulas,
totalizando doze horas-aula.

### Aula 1 — 31/08/2026 — Capítulo 1 e início do Capítulo 2

**Capítulos previstos**:

- **Capítulo 1 — Introdução aos sistemas de controle**;
- **Capítulo 2 — Modelagem e início da linearização**.

**Materiais**:

- 📊 **[Apresentação da disciplina e fundamentos de controle (PDF)](../courses/as765/2026/slides-01-introducao-as765-2026.pdf)**
- 📊 **[Modelagem de sistemas dinâmicos (PDF)](../courses/as765/2026/slides-02-modelagem-as765-2026.pdf)**
- 📊 **[Linearização de sistemas — parte inicial (PDF)](../courses/as765/2026/slides-03-linearizacao-as765-2026.pdf)**

**Conteúdo da aula**:

- objetivos, organização e metodologia da disciplina;
- sistemas de controle em malha aberta e fechada;
- modelagem de sistemas mecânicos, elétricos, térmicos e eletromecânicos;
- representação de EDOs de ordem elevada como sistemas de primeira ordem;
- estados, entradas, perturbações e saídas;
- pontos de operação, expansão de Taylor e introdução à linearização.

### Aula 2 — 14/09/2026 — conclusão do Capítulo 2 e Capítulo 3

**Capítulos previstos**:

- **Capítulo 2 — Linearização de sistemas**;
- **Capítulo 3 — Transformada de Laplace**.

**Materiais**:

- 📊 **[Linearização de sistemas — conclusão (PDF)](../courses/as765/2026/slides-03-linearizacao-as765-2026.pdf)**
- 📊 **[Transformada de Laplace (PDF)](../courses/as765/2026/slides-04-laplace-as765-2026.pdf)**

**Conteúdo da aula**:

- linearização multivariável pelas Jacobianas $A$, $B$, $C$ e $D$;
- linearização numérica por diferenças finitas e método do passo complexo;
- validade local e validação do modelo linear;
- transformada unilateral de Laplace e região de convergência;
- transformação de derivadas com condições iniciais;
- transformada inversa e frações parciais;
- solução de EDOs e teoremas dos valores inicial e final.

### Aula 3 — 21/09/2026 — Capítulo 4

**Capítulo previsto**:

- **Capítulo 4 — Funções de transferência e diagramas de blocos**.

**Material**:

- 📊 **[Funções de transferência e diagramas de blocos (PDF)](../courses/as765/2026/slides-05-funcoes-transferencia-blocos-as765-2026.pdf)**

**Conteúdo da aula**:

- obtenção de funções de transferência a partir de EDOs e modelos em espaço de estados;
- condições iniciais nulas, resposta ao impulso e convolução;
- polos, zeros, ganho estático, grau relativo e estabilidade BIBO;
- realizações não mínimas, modos internos ocultos e matriz de transferências;
- série, paralelo, realimentação e equação característica;
- relações de malha fechada para referência, perturbação e ruído;
- redução sistemática de diagramas e exemplos no MATLAB.

## Cronograma de referência

- **31/08 — Capítulos 1 e 2**: introdução, modelagem, pontos de operação e início da linearização.
- **14/09 — Capítulos 2 e 3**: linearização analítica e numérica, validação e transformada de Laplace.
- **21/09 — Capítulo 4**: funções de transferência, polos, zeros e diagramas de blocos.
- **28/09 — Capítulo 5**: respostas temporais, índices de desempenho, dinâmica dominante e erro em regime.
- **05/10 — Capítulo 6**: estabilidade BIBO e interna, equação característica e critério de Routh-Hurwitz.
- **07/10 — Capítulo 7**: resposta em frequência e diagramas de Bode. Encontro excepcional na quarta-feira.
- **19/10 — Capítulo 8**: diagramas e critério de Nyquist, margens de estabilidade e robustez.
- **26/10 — Capítulo 9**: controladores P, PI, PD e PID, sintonia e limitações práticas.
- **09/11 — Capítulo 10**: Lugar Geométrico das Raízes e projeto de controladores.
- **16/11 — Capítulo 11**: funções de sensibilidade, compensadores e projeto no domínio da frequência.
- **23/11 — Capítulo 12**: controle em espaço de estados, LQR/LQI e observadores. Encerramento do conteúdo.
- **14/12 — Avaliação escrita integradora**: quatro horas-aula; não haverá conteúdo novo.

Os materiais das aulas seguintes serão acrescentados ao longo do período.

## Material de referência

📖 **[Apostila de Sistemas de Controle — edição 2026 (PDF)](../courses/as765/2026/apostila-as765-2026.pdf)** — os capítulos 1 a 3 já incorporam a revisão de 2026; os demais capítulos serão atualizados ao longo do curso.

## Histórico

📚 [Material e cronograma da oferta de 2025](#as-765-controle-2025)

*Última atualização: 14/09/2026*
