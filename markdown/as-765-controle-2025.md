# AS-765: Sistemas de Controle — arquivo de 2025

> 📚 Esta página preserva os materiais e o cronograma da oferta de 2025. Para a oferta atual, consulte [AS-765 em 2026](#as-765-controle).

**Mestrado Profissional em Engenharia Aeronáutica**<br>
**Instituto Tecnológico de Aeronáutica (ITA)**

## Informações do Curso

- **Total**: 12 aulas de 4 horas cada = 48 horas
- **Provas**: 2 provas de 2 horas cada
- **Horas efetivas de conteúdo**: 44 horas
- **Material**: Apostila + Slides + Exemplos MATLAB

## Material do Curso

📊 **[Apresentação Geral do Curso (PDF)](../courses/as765/apresentacao-geral.pdf)**

📖 **[Apostila de Sistemas de Controle (PDF)](../courses/as765/apostila-controle-as765.pdf)** - Versão completa

> ⚠️ **Nota Importante**: Esta é a primeira versão completa da apostila, ainda provisória. O material pode conter erros e precisa de revisão. Comentários e feedback dos alunos são muito bem-vindos!

📝 **[Lista de Exercícios 01 (PDF)](../courses/as765/lista01.pdf)** - Para preparação da 1ª prova (6 de outubro)

📝 **[Lista de Exercícios 02 (PDF)](../courses/as765/lista02_corrigida.pdf)** - Capítulos 6-9: Estabilidade, Resposta em Frequência, Análise de Nyquist e Controladores PID (entrega: 24 de novembro)

> ✅ **Atualização (18/nov/2025)**: Versão corrigida - o exercício 9.3 foi corrigido, a versão anterior não atingia o equilíbrio.

📝 **[Lista de Exercícios 03 (PDF)](../courses/as765/lista03.pdf)** - Entrega: 8 de dezembro de 2025

📝 **[Lista de Exercícios 04 (PDF)](../courses/as765/lista04.pdf)** - Capítulo 12: Controle em Espaço de Estados

> ⚠️ **Nota**: A avaliação do Capítulo 12 (Controle em Espaço de Estados) será realizada exclusivamente através desta lista de exercícios.

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

**Material**: 📊 [Slides Cap 5 - Resposta Dinâmica](../courses/as765/slides-cap5.pdf) *(atualizado em 29/setembro/2025)*

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
  - **Matéria**: Capítulos 1 a 5
  - **Foco**: Modelagem, linearização, função de transferência, resposta temporal

**Material**: 📊 [Slides Cap 6 - Estabilidade](../courses/as765/slides-cap6.pdf)

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

**Material**: 📊 [Slides Cap 7 - Resposta em Frequência - Diagramas de Bode](../courses/as765/slides-cap7.pdf)
**Exemplos MATLAB**: 💻 [Domínio da Frequência (MLX)](../courses/as765/dominio_frequencia.mlx)


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

**Material**: 📊 [Slides Cap 8 - Resposta em Frequência - Análise de Estabilidade](../courses/as765/slides-cap8.pdf)

**Exemplos MATLAB**:
- 💻 [Margens de Estabilidade (MLX)](../courses/as765/20_outubro_2025/margens_estab.mlx)
- 💻 [Diagrama de Nyquist (MLX)](../courses/as765/20_outubro_2025/plot_nyquist.mlx)

> ✅ **Atualização (21/out/2025)**: Versão corrigida - erros relacionados ao sentido de circulação do ponto crítico no diagrama de Nyquist foram corrigidos.


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

**Material**: 📊 [Slides Cap 9 - Controladores PID](../courses/as765/slides_cap9.pdf)

**Exemplos MATLAB**:
- 💻 [Controladores PID (MLX)](../courses/as765/2_nov_2025/aula_3_nov2025_pid.mlx)
- 💻 [Sistemas Simplificados (MLX)](../courses/as765/2_nov_2025/aula3_nov_2025_sistemas_simplificados.mlx)
- 💻 [Anti-Windup PID (M)](../courses/as765/10_nov_2025/windup.m)

> ✅ **Atualização (3/nov/2025)**: Slides do Capítulo 9 adicionados - aborda controladores PID com métodos de sintonia e implementação prática.

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

**Material**: 📊 [Slides Cap 10 - Lugar Geométrico das Raízes](../courses/as765/slides-cap10.pdf)

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

**Material**: 📊 [Slides Cap 11 - Projeto no Domínio da Frequência (Versão Reduzida)](../courses/as765/slides-cap11_red.pdf)

**Leitura Extra**: 📚 [Slides Cap 11 - Versão Completa](../courses/as765/slides_cap11.pdf)

---

### **AULA 11** - Controle em Espaço de Estados
**Capítulos**: Cap 12 | **Data**: 1 de dezembro de 2025 | **Duração**: 4h

**Conteúdo**:
- **Cap 12: Controle em Espaço de Estados** (4h)
  - Introdução ao controle moderno (controle clássico vs moderno)
  - Controlabilidade: definição, teste e matriz de controlabilidade
  - Realimentação de estados: alocação de polos e LQR
  - LQI: LQR com ação integral para rejeição de perturbações
  - Observabilidade: definição, teste e matriz de observabilidade
  - Observadores de estados (Luenberger)
  - Princípio de separação
  - Robustez e sensibilidade a incertezas
  - Síntese e implementação completa
  - Exemplos MATLAB: ctrb(), obsv(), place(), lqr(), ss(), step(), lsim()

**Material**: 📊 [Slides Cap 12 - Controle em Espaço de Estados](../courses/as765/slides-cap12.pdf)

**Exemplos MATLAB**:
- 💻 [Simulação LQR (M)](../courses/as765/1_dez_2025/simulacao_LQR.m)
- 💻 [LQR com Diferentes Matrizes Q (M)](../courses/as765/1_dez_2025/LQR_diferentesQs.m)

---

### **AULA 12** - **2ª PROVA**
**Data**: 5 de dezembro de 2025 | **Duração**: 2h

- **2ª PROVA** (2h)
  - **Matéria**: Capítulos 7 a 11
  - **Foco**: Resposta em frequência, análise de estabilidade (Nyquist), controladores PID, lugar geométrico das raízes, projeto no domínio da frequência

---

## Avaliação

- **1ª Prova (30%)**: Fundamentos (Cap 1-5)
- **2ª Prova (40%)**: Métodos de projeto (Cap 7-11)
- **Entregas (30%)**: Listas de exercícios + Projetos MATLAB
  - Cap 12 (Controle em Espaço de Estados): avaliado exclusivamente pela Lista 04

---

*Última atualização: 1/dezembro/2025*
