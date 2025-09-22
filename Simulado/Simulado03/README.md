**Simulado Completo - Projeto Teste (Skill 08 - Desenvolvimento de Aplicativos Móveis)**

**Aplicativo:** FitTrackr

**Conceito Central:**
O FitTrackr não é sobre treinos complexos ou planos de dieta rígidos. Seu foco é a **simplicidade e a consistência**. O objetivo é criar um aplicativo que seja rápido e fácil de usar diariamente para que o usuário se sinta motivado a registrar suas atividades e refeições sem sentir que é uma tarefa árdua. A interface deve ser limpa, encorajadora e visualmente gratificante.

**Público-Alvo:**
Indivíduos que estão começando uma jornada de saúde e bem-estar, que precisam de uma ferramenta simples para criar o hábito de monitorar suas atividades e ingestão calórica. Eles valorizam a clareza e o feedback visual sobre seu progresso.

---

### **Detalhamento das Telas e Funcionalidades**

#### **1. Fluxo de Onboarding e Autenticação**

*   **Splash Screen:**
    *   **Visão:** A primeira impressão do app. Deve ser rápida, limpa e transmitir a energia da marca "FitTrackr".
    *   **Funcionalidade:** Enquanto a animação do logo ocorre, o app verifica em segundo plano (usando `shared_preferences`) se existe um token de usuário salvo.
        *   **Se sim (usuário logado):** Navega diretamente para a `Dashboard`.
        *   **Se não:** Navega para a tela de `Login`.

*   **Tela de Login:**
    *   **Visão:** Uma tela sem distrações. Logo, campos de email e senha, botão de login e um link claro para o cadastro.
    *   **Funcionalidade:** Validação dos campos (formato de email, senha não vazia). Ao clicar em "Entrar", uma chamada `POST` é feita para a API. Indicadores de `loading` são essenciais. Mensagens de erro (ex: "Email ou senha incorretos") devem ser exibidas de forma clara (Snackbar/Toast). Em sucesso, o token/ID do usuário é salvo localmente e a navegação ocorre para a `Dashboard`.

*   **Tela de Cadastro:**
    *   **Visão:** Um formulário simples para coletar informações essenciais: Nome (para personalização da saudação), Email e Senha.
    *   **Funcionalidade:** Validação em tempo real (ex: confirmação de senha deve bater com a senha). Ao submeter, faz a chamada `POST` para registrar o usuário. Após o sucesso, o ideal é navegar para a tela de Login para que o usuário faça seu primeiro login, ou, para uma UX melhor, logar o usuário automaticamente e levá-lo para a `Dashboard`.

#### **2. Núcleo do Aplicativo (Navegação Principal)**

A navegação principal é feita por uma **Barra de Navegação Inferior (`BottomNavigationBar`)** com quatro seções-chave:

*   **Dashboard (Início):** Onde o usuário "pousa" após o login.
*   **Atividades:** O histórico detalhado de exercícios.
*   **Dieta:** O histórico detalhado de refeições.
*   **Perfil:** Configurações e metas do usuário.

#### **3. Detalhes das Seções Principais**

*   **Tela Dashboard (A Tela Principal):**
    *   **Visão:** Um painel de controle visual e motivador do dia atual. É a tela mais importante para engajamento diário.
    *   **Componentes e Funcionalidades:**
        *   **Saudação:** "Olá, [Nome do Usuário]!" – Personalização que cria conexão. O nome vem da API.
        *   **Resumo Diário (Widgets Circulares):** Três anéis de progresso proeminentes (estilo Apple Watch). Cada anel se preenche conforme o usuário se aproxima da meta.
            *   **Passos:** `(Passos do Dia / Meta de Passos)`.
            *   **Calorias Queimadas:** `(Kcal Ativas / Meta de Kcal Ativas)`.
            *   **Calorias Consumidas:** `(Kcal Consumidas / Meta de Kcal Dieta)`. Este anel pode ter uma cor diferente (ex: Azul) para diferenciar de "queima".
            *   Os dados são obtidos de chamadas `GET` à API que agregam as atividades e refeições do dia.
        *   **Gráfico de Passos Semanais:** Um gráfico de barras simples (`BarChart`) mostrando os passos totais de cada um dos últimos 7 dias. Isso dá ao usuário uma visão rápida de sua consistência.
        *   **Botão de Ação Flutuante (FAB):** Um botão "+" proeminente. Ao ser tocado, ele pode abrir um pequeno menu (ou um `BottomSheet`) com duas opções claras: "Registrar Atividade" e "Registrar Refeição", levando às respectivas telas de registro.

*   **Tela de Registro de Atividade:**
    *   **Visão:** Um formulário de entrada rápida, projetado para ser preenchido em segundos após um treino.
    *   **Funcionalidade:**
        *   **Seleção de Atividade:** Um grid ou lista horizontal com ícones (tênis para corrida, bicicleta para ciclismo, halter para musculação). Tocar em um seleciona o tipo.
        *   **Inputs Numéricos:** Campos otimizados para entrada numérica para Duração, Distância e Calorias.
        *   **Lógica de "Salvar":** Ao clicar, os dados são empacotados em um objeto e enviados via `POST` para o endpoint `/activities` da API. Após o sucesso, o app deve retornar à tela anterior (provavelmente a `Dashboard`), que deve **automaticamente atualizar** seus dados para refletir a nova atividade.

*   **Tela de Registro de Refeição:**
    *   **Visão:** Uma tela para compor uma refeição a partir de uma lista de alimentos.
    *   **Funcionalidade:**
        *   **Seleção de Refeição:** Botões para "Café da Manhã", "Almoço", etc.
        *   **Busca de Alimentos:** Um campo de texto que, ao digitar, faz uma chamada à API (ex: `GET /foods?q=[termo_busca]`) para encontrar alimentos. O `db.json` precisaria de uma lista de alimentos com calorias.
        *   **Lista da Refeição:** Ao selecionar um alimento da busca, ele é adicionado a uma lista na tela, e o total de calorias da refeição é atualizado.
        *   **Lógica de "Salvar":** Envia a lista de alimentos e o tipo de refeição via `POST` para `/meals`. A `Dashboard` também deve ser atualizada ao retornar.

*   **Tela de Histórico de Atividades:**
    *   **Visão:** Uma lista infinita (`ListView.builder`) de todas as atividades passadas.
    *   **Funcionalidade:** Faz uma chamada `GET` para `/activities?userId=[id]&_sort=date&_order=desc` para buscar as atividades do usuário em ordem cronológica. Cada item da lista é um card bem formatado que exibe as informações essenciais. Tocar em um item poderia (como funcionalidade extra) abrir uma tela de detalhes daquela atividade específica.

*   **Tela de Perfil:**
    *   **Visão:** A central de configurações do usuário.
    *   **Funcionalidade:**
        *   **Dados Pessoais:** Exibe a foto (placeholder ou URL da API), nome e email.
        *   **Gerenciamento de Metas:** Exibe as metas atuais (passos, calorias). Ao tocar, abre um `Dialog` ou navega para uma nova tela onde o usuário pode inserir novos valores numéricos para suas metas. Salvar faz uma chamada `PUT/PATCH` para `/users/{id}`.
        *   **Logout:** Limpa os dados de sessão (`shared_preferences`) e navega o usuário de volta para a tela de `Login`.

---


**Módulo 1: FitTrackr - Design e Prototipagem (UI/UX)**

**Duração:** 3 Horas
**Ferramenta:** Figma
**Dispositivo Alvo:** Mobile (Ex: Figma Frame "Android Large")

**Introdução:**
Você é o designer UI/UX responsável pelo projeto FitTrackr. Sua tarefa é criar um protótipo de alta fidelidade para o aplicativo, focando em uma experiência de usuário intuitiva para registro de dados de saúde.

**Demandas Gerais:**
1.  Siga a guia de estilos abaixo.
2.  Crie um protótipo com navegação funcional entre todas as telas.
3.  Implemente temas **Dark e Light**.
4.  Adicione **pelo menos 1 nova tela** para aprimorar a UX (ex: tela de "Conquistas/Badges", tela de "Configurações de Notificações").

**Guia de Estilos:**
*   **LOGOTIPO:** "FitTrackr" com um ícone de um tênis de corrida estilizado ou um gráfico de pulso.
*   **CORES:**
    *   Primária: #00A878 (Verde Esportivo)
    *   Secundária: #4059AD (Azul Profundo)
    *   Acento/Erro: #D90368 (Magenta Vibrante)
    *   Fundo (Light): #F7F7F7
    *   Fundo (Dark): #121212
    *   Texto (Light): #222222
    *   Texto (Dark): #EFEFEF
*   **TIPOGRAFIA:**
    *   Títulos: Montserrat Bold - 22px
    *   Corpo: Open Sans Regular - 16px
    *   Pequeno/Legendas: Open Sans Regular - 14px

**Demandas das Páginas:**
1.  **Splash Screen:** Logo animado (ex: o tênis "correndo" até o texto).
2.  **Login/Cadastro:** Telas padrão com campos para email/senha e opção de cadastro com nome, email, senha.
3.  **Dashboard (Tela Principal):**
    *   Saudação ao usuário: "Olá, [Nome]!".
    *   Resumo do dia: Círculos de progresso para "Passos", "Calorias Queimadas" e "Calorias Consumidas".
    *   Gráfico de barras simples mostrando os passos dos últimos 7 dias.
    *   Botões de Ação Rápida (FAB ou na parte inferior): "+" para adicionar nova atividade ou refeição.
    *   Barra de Navegação Inferior com ícones para: "Dashboard", "Atividades", "Dieta", "Perfil".
4.  **Tela de Registro de Atividade:**
    *   Seleção do tipo de atividade (Corrida, Ciclismo, Musculação, etc. - usar ícones).
    *   Inputs para "Duração" (ex: 00:45:00) e "Distância" (se aplicável, ex: 5.2 km).
    *   Campo para "Calorias Queimadas" (pode ser calculado ou inserido manualmente).
    *   Botão "Salvar Atividade".
5.  **Tela de Registro de Refeição:**
    *   Seleção do tipo de refeição (Café da Manhã, Almoço, Jantar, Lanche).
    *   Campo de busca para "Adicionar Alimento".
    *   Lista de alimentos adicionados à refeição.
    *   Resumo de calorias da refeição.
    *   Botão "Salvar Refeição".
6.  **Tela de Histórico de Atividades:**
    *   Lista cronológica das atividades registradas. Cada item mostra: Ícone da atividade, nome, data, duração/distância.
7.  **Tela de Perfil:**
    *   Foto do usuário, nome, email.
    *   Metas do usuário (ex: Meta diária de passos, meta de calorias). Opção para editar metas.
    *   Opção para Sair (Logout).

**Instruções (Módulo 1):**
1.  Crie o projeto no Figma.
2.  Exporte o link do protótipo funcional.
3.  Adicione o arquivo `.fig` ao GIT: `08_M1_FitTrackr_XX_Nome`.

---

**Módulo 2: FitTrackr - Implementação da Interface (Flutter)**

**Duração:** 3 Horas
**Ferramenta:** Flutter
**Dispositivo Alvo:** Emulador Mobile Android

**Introdução:**
Implemente a interface do FitTrackr em Flutter com base no design do Módulo 1. O foco é na construção da UI, navegação e animações, usando dados *mockados estaticamente* dentro do código.

**Demandas Funcionais:**
1.  **Estrutura do Projeto:** Crie uma estrutura de pastas organizada (ex: `screens`, `widgets`, `models`).
2.  **Implementação da UI:** Converta todas as telas do Figma para widgets Flutter, respeitando o design, cores, fontes e temas Dark/Light.
3.  **Navegação:** Implemente a navegação entre todas as telas, incluindo a barra de navegação inferior e o fluxo de login/logout.
4.  **Animações:** Implemente animações simples:
    *   Animação da Splash Screen.
    *   Animações de transição de tela.
    *   Animação dos círculos de progresso no Dashboard quando os valores mudam (simulado).
5.  **Dados Mockados:** Crie modelos de dados (`.dart` files) para `User`, `Activity`, `Meal`, `FoodItem` e popule listas estáticas para exibir nos históricos. A interação (adicionar/salvar) não precisa persistir, apenas atualizar a UI temporariamente.
6.  **Gerenciamento de Estado (Simples):** Use `StatefulWidget` ou um gerenciador de estado simples (como Provider) para controlar a troca de tema (Dark/Light) e a aba selecionada na barra de navegação.

**Instruções (Módulo 2):**
1.  Desenvolva o aplicativo Flutter.
2.  Garanta que ele compile e rode no emulador.
3.  Adicione todo o projeto Flutter ao GIT: `08_M2_FitTrackr_XX_Nome`.

---

**Módulo 3: FitTrackr - Integração com API (Backend)**

**Duração:** 3 Horas
**Ferramenta:** Flutter, json-server

**Introdução:**
Substitua os dados mockados estáticos do Módulo 2 por chamadas a uma API REST local (simulada com `json-server`). O aplicativo agora deve ler e escrever dados de forma persistente.

**API Mock (`db.json` para json-server):**
(Um arquivo `db.json` será fornecido, similar aos exemplos anteriores, com endpoints para `/users`, `/activities`, `/meals`).

**Demandas Funcionais:**
1.  **Configuração da API:** Configure um serviço ou classe para fazer chamadas HTTP (usando `http` ou `dio`).
2.  **Fluxo de Autenticação:**
    *   Implemente as chamadas `POST /login` e `POST /register`.
    *   Persista o token de autenticação (ou user ID) localmente (usando `shared_preferences`).
    *   Implemente a lógica de auto-login na Splash Screen se um token válido existir.
3.  **Leitura de Dados (GET):**
    *   No Dashboard, busque o resumo do dia e o histórico de passos do usuário logado.
    *   Na tela de Histórico de Atividades, busque todas as atividades do usuário.
    *   Na tela de Dieta, busque as refeições do dia.
4.  **Escrita de Dados (POST/PUT/DELETE):**
    *   Implemente a funcionalidade de "Salvar Atividade" para fazer um `POST` no endpoint `/activities`.
    *   Implemente a funcionalidade de "Salvar Refeição" para fazer um `POST` no endpoint `/meals`.
    *   Na tela de Perfil, implemente a edição de metas (fazendo um `PUT` ou `PATCH` no endpoint `/users/{id}`).
5.  **Tratamento de Erros e Loading:**
    *   Mostre indicadores de carregamento (ex: `CircularProgressIndicator`) enquanto os dados da API são buscados.
    *   Mostre mensagens de erro amigáveis (ex: Snackbar/Toast) caso uma chamada à API falhe.

**Instruções (Módulo 3):**
1.  Continue o desenvolvimento a partir do projeto do Módulo 2.
2.  Integre todas as funcionalidades de API.
3.  Adicione as modificações ao GIT: `08_M3_FitTrackr_XX_Nome`.

---

**Módulo 4: FitTrackr - Finalização e Deploy**

**Duração:** 3 Horas
**Ferramenta:** Flutter, Android Studio

**Introdução:**
Neste módulo final, você irá polir o aplicativo, adicionar funcionalidades extras, preparar a documentação e gerar a versão final para "lançamento".

**Demandas Funcionais:**
1.  **Polimento da UI/UX:**
    *   Revise todo o aplicativo em busca de inconsistências de design ou bugs de UI.
    *   Adicione feedback tátil (vibração) a botões importantes (ex: salvar).
2.  **Funcionalidade Adicional: Gráficos:**
    *   Na Dashboard ou em uma nova tela de "Progresso", use uma biblioteca de gráficos (ex: `fl_chart`) para exibir de forma mais elaborada os dados do usuário (ex: gráfico de linha da variação de peso, gráfico de pizza da distribuição de macronutrientes do dia). Os dados devem vir da API.
3.  **Funcionalidade Adicional: Notificações Locais:**
    *   Use uma biblioteca (ex: `flutter_local_notifications`) para agendar uma notificação local diária que lembre o usuário de registrar suas atividades (ex: "Não se esqueça de registrar seu dia no FitTrackr!").
4.  **Documentação:**
    *   Crie um arquivo `README.md` na raiz do projeto explicando:
        *   Como configurar e rodar o projeto.
        *   Como iniciar o `json-server` com o `db.json`.
        *   Uma breve descrição das bibliotecas utilizadas.
5.  **Geração do APK:**
    *   Prepare o aplicativo para build (ícone, nome do app).
    *   Gere um APK de release assinado (`--release`).

**Instruções (Módulo 4):**
1.  Continue o desenvolvimento a partir do projeto do Módulo 3.
2.  Implemente as funcionalidades de polimento, gráficos e notificações.
3.  Crie o arquivo `README.md`.
4.  Gere o APK final.
5.  Adicione todo o projeto finalizado e o APK na raiz ao GIT: `08_M4_FitTrackr_XX_Nome`.

#### **4. Módulo 4 - Dicas de Polimento e Funcionalidades Avançadas**

*   **Gráficos Avançados:**
    *   **Visão:** Uma nova tela chamada "Progresso", acessível talvez pelo Perfil.
    *   **Funcionalidade:** Usando `fl_chart`, esta tela mostraria:
        *   **Gráfico de Linha:** Evolução do peso do usuário ao longo do tempo (exigiria um novo campo e endpoint na API).
        *   **Gráfico de Pizza:** Distribuição de macronutrientes (proteínas, carboidratos, gorduras) do dia, com base nos alimentos registrados. Isso exigiria que a API de alimentos também retornasse esses dados.

*   **Notificações Locais:**
    *   **Visão:** Sem interface visível, exceto talvez uma tela de "Configurações de Notificações" onde o usuário pode ligar/desligar o lembrete.
    *   **Funcionalidade:** Após o primeiro login ou na inicialização do app, ele agenda uma notificação recorrente (`flutter_local_notifications`). Por exemplo, todo dia às 20h, o app dispara uma notificação local (não depende de internet) com o texto "Hora de registrar seu progresso no FitTrackr hoje!".

*   **Documentação e Build:**
    *   **README.md:** Um guia essencial para qualquer outro desenvolvedor (ou avaliador) entender como o projeto funciona.
    *   **APK Assinado:** O "produto final". O competidor deve saber o processo de `key generation` e `signing` para gerar um APK de release, que é diferente de um de debug.
