## Tabela CIS

A pontuação é distribuída de forma a valorizar a complexidade de cada módulo:
*   **Módulo 1 (Design):** 15 pontos
*   **Módulo 2 (UI Implementation):** 25 pontos
*   **Módulo 3 (API Integration):** 35 pontos
*   **Módulo 4 (Finalization & Features):** 25 pontos

---

### **CIS - Esquema de Pontuação (Marking Scheme) - Skill 08: FitTrackr**
**Total de Pontos: 100.00**

---

#### **A - MÓDULO 1: DESIGN E PROTOTIPAGEM (15.00 PONTOS)**

| **Critério** | **Subcritério** | **Aspecto** | **Tipo** | **Pontos** |
| :--- | :--- | :--- | :--- | ---: |
| **A1 - Demandas Gerais (3.00)** | **A1.1 - Guia de Estilos** | Cores, fontes e logo aplicados consistentemente | M | 1.00 |
| | **A1.2 - Prototipagem** | Navegação entre todas as telas está funcional e correta | M | 1.00 |
| | **A1.3 - Temas** | Telas duplicadas e estilizadas para os temas Light & Dark | M | 1.00 |
| **A2 - Telas Essenciais (8.00)** | **A2.1 - Onboarding** | Telas de Splash, Login e Cadastro estão completas | M | 1.50 |
| | **A2.2 - Dashboard** | Resumo (anéis de progresso) e gráfico de barras estão presentes e bem diagramados | M | 2.00 |
| | **A2.3 - Registro** | Telas de Registro de Atividade e Refeição seguem os requisitos | M | 2.00 |
| | **A2.4 - Histórico/Perfil** | Telas de Histórico de Atividades e Perfil estão completas e claras | M | 1.50 |
| | **A2.5 - Tela Extra** | Uma nova tela que agrega valor à UX foi projetada | M | 1.00 |
| **A3 - Julgamento (4.00)** | **A3.1 - Qualidade Visual** | Qualidade geral do design, alinhamento, espaçamento e apelo visual | J | 2.00 |
| | **A3.2 - UX/Intuitividade** | O fluxo de uso do protótipo é claro, lógico e intuitivo | J | 2.00 |

---

#### **B - MÓDULO 2: IMPLEMENTAÇÃO DA INTERFACE (25.00 PONTOS)**

| **Critério** | **Subcritério** | **Aspecto** | **Tipo** | **Pontos** |
| :--- | :--- | :--- | :--- | ---: |
| **B1 - Estrutura e Fidelidade (7.00)** | **B1.1 - Estrutura do Código** | Projeto organizado em pastas (screens, widgets, models, etc.) | M | 2.00 |
| | **B1.2 - Fidelidade ao Design**| Layout das telas corresponde fielmente ao protótipo do Módulo 1 | J | 3.00 |
| | **B1.3 - Tema Dark/Light** | Troca de tema funcional e aplicada em todas as telas | M | 2.00 |
| **B2 - Funcionalidade da UI (13.00)** | **B2.1 - Navegação** | BottomNavigationBar e navegação entre telas implementada corretamente | M | 3.00 |
| | **B2.2 - Dashboard** | Componentes da Dashboard (anéis, gráfico) renderizados com dados estáticos | M | 3.00 |
| | **B2.3 - Formulários de Registro** | Inputs nas telas de registro funcionam e respondem à interação do usuário | M | 3.00 |
| | **B2.4 - Listas** | Histórico de atividades renderizado corretamente a partir de uma lista estática | M | 2.00 |
| | **B2.5 - Animações** | Animações básicas (Splash, transição de tela) implementadas | M | 2.00 |
| **B3 - Julgamento (5.00)** | **B3.1 - Qualidade do Código** | Código Flutter limpo, legível e uso de widgets reutilizáveis | J | 3.00 |
| | **B3.2 - Performance da UI** | App responsivo, sem travamentos ou lentidão na interface | J | 2.00 |

---

#### **C - MÓDULO 3: INTEGRAÇÃO COM API (35.00 PONTOS)**

| **Critério** | **Subcritério** | **Aspecto** | **Tipo** | **Pontos** |
| :--- | :--- | :--- | :--- | ---: |
| **C1 - Configuração e Autenticação (10.00)** | **C1.1 - Conectividade** | Estrutura de serviço para chamadas HTTP está implementada e funcional | M | 3.00 |
| | **C1.2 - Login/Registro** | Chamadas POST para /users funcionam corretamente | M | 3.00 |
| | **C1.3 - Gerenciamento de Sessão** | Token/ID do usuário é salvo localmente e usado para auto-login | M | 4.00 |
| **C2 - Operações CRUD (20.00)** | **C2.1 - Leitura de Dados (GET)** | Dashboard e históricos são populados com dados da API para o usuário logado | M | 6.00 |
| | **C2.2 - Criação de Dados (POST)** | Registro de novas atividades e refeições persiste os dados na API | M | 7.00 |
| | **C2.3 - Atualização (PUT/PATCH)** | Edição de metas no perfil do usuário atualiza os dados na API | M | 4.00 |
| | **C2.4 - Tratamento de Loading/Erro** | Indicadores de carregamento e mensagens de erro são exibidos durante chamadas à API | M | 3.00 |
| **C3 - Julgamento (5.00)** | **C3.1 - Lógica de Dados** | A lógica para buscar, enviar e atualizar dados é eficiente e robusta | J | 3.00 |
| | **C3.2 - Gerenciamento de Estado** | A atualização da UI após operações de API (ex: adicionar item) é consistente | J | 2.00 |

---

#### **D - MÓDULO 4: FINALIZAÇÃO E DEPLOY (25.00 PONTOS)**

| **Critério** | **Subcritério** | **Aspecto** | **Tipo** | **Pontos** |
| :--- | :--- | :--- | :--- | ---: |
| **D1 - Funcionalidades Avançadas (15.00)** | **D1.1 - Gráficos com Dados Reais** | Gráfico de progresso (linha ou pizza) implementado com dados da API | M | 7.00 |
| | **D1.2 - Notificações Locais**| Notificação diária agendada e funcional | M | 5.00 |
| | **D1.3 - Polimento da UI/UX** | Feedbacks táteis e micro-interações adicionadas | M | 3.00 |
| **D2 - Finalização do Projeto (6.00)** | **D2.1 - Documentação** | Arquivo README.md está completo e claro | M | 3.00 |
| | **D2.2 - Geração do APK** | APK de release assinado foi gerado corretamente | M | 3.00 |
| **D3 - Julgamento (4.00)** | **D3.1 - Qualidade do Produto Final**| O aplicativo como um todo é coeso, estável e bem acabado | J | 2.00 |
| | **D3.2 - Complexidade e Solução**| O competidor demonstrou habilidade em resolver problemas complexos | J | 2.00 |

---
**Legenda:**
*   **M:** Medição (Measurement) - Avaliação objetiva. O aspecto foi ou não foi cumprido. Pode ter pontuação parcial se definido.
*   **J:** Julgamento (Judgement) - Avaliação subjetiva baseada na qualidade, usando uma escala (ex: 0-3 ou 0-4 pontos).