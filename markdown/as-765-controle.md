# AS-765: Sistemas de Controle

**Mestrado Profissional em Engenharia Aeronáutica**  
**Instituto Tecnológico de Aeronáutica (ITA)**

## Informações do Curso

- **Total**: 12 aulas de 4 horas cada = 48 horas
- **Provas**: 2 provas de 2 horas cada
- **Horas efetivas de conteúdo**: 44 horas
- **Material**: Apostila + Slides + Exemplos MATLAB

## Material do Curso

📊 **[Apresentação Geral do Curso (PDF)](../courses/as765/apresentacao-geral.pdf)**

📖 **[Apostila de Sistemas de Controle (PDF)](../courses/as765/apostila-controle-as765.pdf)**

> ⚠️ **Nota Importante**: O conteúdo da apostila é provisório e a apostila está incompleta. A última atualização foi feita em 30/agosto/2025.

## Cronograma e Material das Aulas

### **AULA 1** - Introdução e Modelagem
**Capítulos**: Cap 1 + início Cap 2 | **Duração**: 4h

**Conteúdo**:
- **Cap 1: Modelagem de Sistemas Dinâmicos** (2.5h)
  - Introdução aos modelos de sistemas
  - Sistema massa-mola-amortecedor
  - Modelagem de sistemas elétricos, mecânicos e térmicos
  - Exemplos MATLAB: simulação de sistemas dinâmicos
  
- **Cap 2: Linearização de Sistemas** (1.5h)
  - Conceitos de linearização
  - Ponto de operação
  - Aproximação por série de Taylor

**Material**: 📊 [Slides Cap 1 - Modelagem](../courses/as765/slides-aula1.pdf)
**Material**: 📊 [Slides Cap 2 - Linearização](../courses/as765/slides-aula2.pdf)

---

### **AULA 2** - Linearização e Transformadas
**Capítulos**: Finalização Cap 2 + Cap 3 | **Duração**: 4h

**Conteúdo**:
- **Cap 2: Linearização de Sistemas (cont.)** (1.5h)
  - Linearização de sistemas não-lineares
  - Exemplos práticos (pêndulo, sistemas de potência)
  - Validação da linearização
  
- **Cap 3: Transformadas de Laplace** (2.5h)
  - Revisão da transformada de Laplace
  - Propriedades e teoremas importantes
  - Transformada inversa
  - Aplicação a sistemas de controle

**Material**: 📊 [Slides Cap 2 - Linearização](../courses/as765/slides-aula2.pdf)
**Material**: 📊 [Slides Cap 3 - Transformadas de Laplace](../courses/as765/slides-aula3.pdf)

---

### **AULA 3** - Função de Transferência e Diagramas
**Capítulos**: Cap 4 | **Duração**: 4h

**Conteúdo**:
- **Cap 4: Função de Transferência e Diagramas de Blocos** (4h)
  - Conceito de função de transferência
  - Propriedades e limitações
  - Álgebra de diagramas de blocos
  - Simplificação de diagramas complexos
  - Função de transferência de malha fechada
  - Exemplos MATLAB: manipulação de funções de transferência

**Material**: 📊 [Slides Cap 4 - Função de Transferência](../courses/as765/slides-cap4.pdf)


---

### **AULA 4** - Resposta Dinâmica de Sistemas
**Capítulos**: Cap 5 | **Duração**: 4h

**Conteúdo**:
- **Cap 5: Resposta Dinâmica de Sistemas Lineares** (4h)
  - Resposta de sistemas de 1ª ordem
  - Resposta de sistemas de 2ª ordem
  - Índices de desempenho (Mp, tp, ts, tr)
  - Sistemas de ordem superior
  - Aproximação por polos dominantes
  - Exemplos MATLAB: análise temporal, stepinfo()

**Material**: 📊 [Slides Cap 5 - Resposta Dinâmica](../courses/as765/slides-cap5.pdf)

---

### **AULA 5** - Estabilidade + **1ª PROVA**
**Capítulos**: Cap 6 + Avaliação | **Duração**: 2h + 2h prova

**Conteúdo**:
- **Cap 6: Estabilidade** (2h)
  - Conceito de estabilidade BIBO
  - Critério de Routh-Hurwitz
  - Análise de estabilidade de sistemas
  - Margens de estabilidade básicas

- **1ª PROVA** (2h)
  - **Matéria**: Capítulos 1 a 6
  - **Foco**: Modelagem, linearização, função de transferência, resposta temporal, estabilidade básica

---

### **AULA 6** - Resposta em Frequência
**Capítulos**: Cap 7 | **Duração**: 4h

**Conteúdo**:
- **Cap 7: Resposta em Frequência** (4h)
  - Conceitos fundamentais de resposta em frequência
  - Diagramas de Bode (magnitude e fase)
  - Construção gráfica de Bode
  - Interpretação física dos diagramas
  - Relação entre resposta temporal e frequencial
  - Exemplos MATLAB: bode(), margin(), bandwidth

---

### **AULA 7** - Análise de Estabilidade no Domínio da Frequência
**Capítulos**: Cap 8 | **Duração**: 4h

**Conteúdo**:
- **Cap 8: Análise de Estabilidade no Domínio da Frequência** (4h)
  - Critério de Nyquist
  - Diagramas de Nyquist
  - Margens de estabilidade (ganho e fase)
  - Sistemas de fase mínima e não-mínima
  - Análise de robustez
  - Exemplos MATLAB: nyquist(), margin(), allmargin()

---

### **AULA 8** - Controladores PID
**Capítulos**: Cap 9 | **Duração**: 4h

**Conteúdo**:
- **Cap 9: Controladores PID** (4h)
  - Ação proporcional, integral e derivativa
  - Efeitos de cada ação no sistema
  - Métodos de sintonia (Ziegler-Nichols, IMC, etc.)
  - Implementação prática de PIDs
  - Problemas comuns (windup, ruído derivativo)
  - Exemplos MATLAB: pid(), pidtune(), step()

---

### **AULA 9** - Lugar Geométrico das Raízes (LGR)
**Capítulos**: Cap 10 | **Duração**: 4h

**Conteúdo**:
- **Cap 10: Lugar Geométrico das Raízes** (4h)
  - Conceitos fundamentais do LGR
  - Regras de construção
  - Interpretação do lugar das raízes
  - Projeto de controladores usando LGR
  - Efeitos de zeros e polos
  - Exemplos MATLAB: rlocus(), rlocfind(), rlocus design

---

### **AULA 10** - Projeto no Domínio da Frequência
**Capítulos**: Cap 11 | **Duração**: 4h

**Conteúdo**:
- **Cap 11: Projeto no Domínio da Frequência** (4h)
  - Compensadores lead, lag e lead-lag
  - Projeto usando diagramas de Bode
  - Especificações de desempenho em frequência
  - Trade-offs no projeto
  - Implementação e validação
  - Exemplos MATLAB: compensador design, bode(), step()

---

### **AULA 11** - Controle Moderno - Parte I
**Capítulos**: Cap 12 (Parte I) | **Duração**: 4h

**Conteúdo**:
- **Cap 12: Controle no Espaço de Estados - Fundamentos** (4h)
  - Representação em espaço de estados
  - Conversão entre função de transferência e espaço de estados
  - Matriz de transição de estados
  - Controlabilidade e observabilidade
  - Exemplos MATLAB: ss(), c2d(), ctrb(), obsv()

---

### **AULA 12** - Controle Moderno - Parte II + **2ª PROVA**
**Capítulos**: Cap 12 (Parte II) + Avaliação Final | **Duração**: 2h + 2h prova

**Conteúdo**:
- **Cap 12: Controle no Espaço de Estados - Aplicações** (2h)
  - Projeto de controladores por alocação de polos
  - Observadores de estados (Estimadores de Luenberger)
  - Introdução ao controle ótimo (LQR)
  - **Aplicação prática MATLAB**: Controle de atitude de aeronave
  - Simulações avançadas e validação

- **2ª PROVA** (2h)
  - **Matéria**: Capítulos 7 a 12
  - **Foco**: Frequência, estabilidade avançada, PID, LGR, compensadores, espaço de estados

---

## Avaliação

- **1ª Prova (30%)**: Fundamentos (Cap 1-6)
- **2ª Prova (40%)**: Métodos de projeto (Cap 7-12)
- **Entregas (30%)**: Listas de exercícios + Projetos MATLAB

---

*Última atualização: 31/agosto/2025*