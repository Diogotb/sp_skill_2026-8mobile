


**TEMA:** **"CineFindr" - A Movie Discovery and Watchlist App**

---

**Simulado - Projeto Teste (Skill 08 - Desenvolvimento de Aplicativos Móveis)**

**Aplicativo:** CineFindr

**Descrição Geral:** CineFindr é um aplicativo móvel que permite aos usuários descobrir filmes populares, em cartaz e bem avaliados. Os usuários podem pesquisar filmes, ver detalhes, assistir a trailers (simulado) e adicionar filmes à sua lista de interesse pessoal (watchlist).

**Tecnologias Base (conforme Descritivo Técnico e exemplos):**
*   **Design:** Figma
*   **Desenvolvimento:** Flutter (utilizando SDK e bibliotecas padrão/comuns)
*   **Versionamento:** Git

---

**Módulo 1: CineFindr - Design (Simulação de Módulo A)**

**Duração:** 3 Horas
**Ferramenta:** Figma
**Dia:** 1 

**Introdução:**
Você é o designer UI/UX encarregado de criar a interface do aplicativo CineFindr. O Product Manager forneceu wireframes conceituais (descritos abaixo). Sua tarefa é traduzir esses conceitos em um design de aplicativo polido, intuitivo e visualmente atraente, seguindo as diretrizes de estilo e requisitos gerais.

**Demandas Gerais:**
1.  Todos os textos devem ser exatamente como especificados nas descrições das telas (exceto dados dinâmicos como nomes de filmes).
2.  O protótipo deve seguir padrões de acessibilidade (contraste de cores, tamanho de fonte legível).
3.  Todas as páginas devem ter melhorias de design em relação aos wireframes conceituais, focando na experiência do usuário.
4.  Você pode usar os recursos gráficos (ícones, imagens placeholder) fornecidos no diretório `media-files` (simulado) ou encontrar/criar os seus próprios, desde que sigam o estilo.
5.  Deve haver navegação funcional (links) entre todas as telas e botões interativos no protótipo Figma.
6.  Adicione a opção de troca de tema **dark/light mode** acessível através do menu lateral (Drawer). O design deve apresentar *ambos* os temas aplicados consistentemente.
7.  Adicione **pelo menos 1 nova tela** não descrita nos wireframes para aprimorar a UX (ex: tela de configurações de conta, tela de feedback, tela de gêneros).
8.  Siga a guia de estilos abaixo:

    *   **LOGOTIPO:** (Criar um logo simples para "CineFindr" - ex: rolo de filme + lupa)
    *   **ÍCONE DO APLICATIVO:** (Versão simplificada do logo)
    *   **CORES:**
        *   Primária: #FF7F11 (Laranja Vibrante)
        *   Secundária: #00A6A6 (Azul-Verde)
        *   Fundo (Light): #F5F5F5 (Cinza Claro)
        *   Fundo (Dark): #1E1E1E (Cinza Escuro)
        *   Texto Principal (Light): #212121 (Quase Preto)
        *   Texto Principal (Dark): #FFFFFF (Branco)
        *   Erro: #D32F2F (Vermelho)
    *   **TIPOGRAFIA:**
        *   Títulos: Roboto Bold - 20px / 24px
        *   Corpo: Roboto Regular - 16px
        *   Pequeno: Roboto Regular - 14px

**Demandas das Páginas (Wireframes Conceituais):**

1.  **Splash Screen:**
    *   *Componentes:* Logo do CineFindr.
    *   *Requisitos:* Duração de 3-5 segundos. Animação suave do logo (ex: fade in e scale up). Animação de fundo sutil (ex: gradiente mudando lentamente).

2.  **Tela de Login:**
    *   *Componentes:* Logo, Campos de "Email" e "Senha", Botão "Entrar", Link "Esqueceu a senha?", Link "Não tem conta? Cadastre-se".
    *   *Requisitos:* Layout limpo. Indicador visual de campo ativo. Ícone para mostrar/ocultar senha.

3.  **Tela de Cadastro:**
    *   *Componentes:* Título "Criar Conta", Campos "Nome", "Email", "Senha", "Confirmar Senha", Botão "Cadastrar", Link "Já tem conta? Faça Login".
    *   *Requisitos:* Validação visual básica (ex: highlight de erro simples). Indicador de força da senha (design apenas).

4.  **Tela Principal (Home/Descoberta):**
    *   *Componentes:* Título "Descobrir", Barra de Pesquisa, Seção "Em Cartaz" (Carrossel horizontal de pôsteres), Seção "Populares" (Lista/Grid vertical de pôsteres com título e avaliação), Ícone de Menu (Drawer).
    *   *Requisitos:* Design atraente para listas de filmes. Carrossel funcional no protótipo. Espaçamento adequado.

5.  **Tela de Detalhes do Filme:**
    *   *Componentes:* Pôster grande ou imagem de fundo, Título do Filme, Avaliação (estrelas), Duração, Gênero(s), Sinopse, Botão "Adicionar à Watchlist" (com estado ativo/inativo), Seção "Trailer" (placeholder para vídeo), talvez seção "Elenco". Botão Voltar.
    *   *Requisitos:* Hierarquia visual clara. Informações bem organizadas. Botão de watchlist deve indicar claramente se o filme está ou não na lista.

6.  **Tela da Watchlist:**
    *   *Componentes:* Título "Minha Lista", Lista/Grid vertical de filmes adicionados (pôster, título), Mensagem caso a lista esteja vazia, Ícone de Menu (Drawer).
    *   *Requisitos:* Permitir a remoção de filmes (ex: ícone 'X' ou swipe - indicar no design).

7.  **Menu Lateral (Drawer):**
    *   *Componentes:* Cabeçalho (com nome/email do usuário placeholder e avatar), Item "Descobrir", Item "Minha Lista", Item "Configurações" (ou a tela nova que você criou), Botão Toggle Dark/Light mode, Item "Sair".
    *   *Requisitos:* Animação de abertura/fechamento suave. Item ativo destacado. Toggle de tema funcional no protótipo (muda o design).

**Instruções para o Competidor:**
1.  Crie o projeto no Figma com todas as telas e interações descritas.
2.  Implemente os temas Dark e Light.
3.  Exporte o link do protótipo Figma funcional.
4.  Adicione o arquivo Figma (`.fig`) a um repositório no servidor GIT com a nomenclatura: `08_Modulo_1_CineFindr_Nome`.

**Esquema de Pontuação (Total 15 pontos - Exemplo):**
*   Demandas Gerais (Estilo, Acessibilidade, Dark/Light, Nova Tela, Navegação): 3,50
*   Splash Screen (Design, Animação concebida): 1,00
*   Login (Layout, Componentes): 1,50
*   Cadastro (Layout, Componentes, Indicador senha): 1,50
*   Home (Layout, Carrossel, Listas, Pesquisa): 2,50
*   Detalhes Filme (Layout, Info, Botão estado): 2,00
*   Watchlist (Layout, Lista, Remoção): 1,50
*   Drawer Menu (Layout, Itens, Toggle): 1,50
*   Julgamento (Qualidade geral do design, UX, Melhorias): Bônus/Ajuste (até 2,00 )


**Módulo 2: CineFindr - Funcionalidades (Simulação de Módulo B)**

**Duração:** 3 Horas
**Ferramenta:** Flutter (com Android Studio/VS Code)
**Dia:** 2

**Introdução:**
Com base no design criado no Módulo 1, sua tarefa é implementar a funcionalidade do aplicativo CineFindr usando Flutter. Você se conectará a uma API  para buscar dados de filmes e gerenciar a watchlist do usuário (simulada localmente - será fornecida ).

**API Mock (Simulada - Endpoints Esperados):**
*   `POST /login` (body: {email, password}) -> `200 OK` {token, userId, name} / `401 Unauthorized`
*   `POST /register` (body: {name, email, password}) -> `201 Created` / `400 Bad Request` (ex: email já existe)
*   `GET /movies/now_playing` -> `200 OK` [{id, title, posterUrl, rating}]
*   `GET /movies/popular` -> `200 OK` [{id, title, posterUrl, rating}]
*   `GET /movies/search?query={searchTerm}` -> `200 OK` [{id, title, posterUrl, rating}]
*   `GET /movies/{movieId}` -> `200 OK` {id, title, posterUrl, rating, duration, genres[], overview, trailerUrl_placeholder}
*   `GET /watchlist/{userId}` -> `200 OK` [{movieId}] (Apenas IDs dos filmes na watchlist)
*   `POST /watchlist/{userId}` (body: {movieId}) -> `200 OK` (Adiciona filme)
*   `DELETE /watchlist/{userId}/{movieId}` -> `200 OK` (Remove filme)
*(Nota: O competidor usaria uma biblioteca como Dio ou http para interagir com esses endpoints. A API pode ser simulada com ferramentas como Mockoon ou implementada de forma simples se necessário.)*

**Demandas Gerais:**
1.  Implementar a interface o mais próximo possível do design do Módulo 1.
2.  Gerenciar o estado do aplicativo (ex: estado de login, watchlist, tema). Provider, Riverpod, BLoC ou GetX são opções comuns.
3.  Implementar a navegação entre telas.
4.  Implementar a troca de tema Dark/Light funcionalmente.
5.  Tratar erros de API e falta de conexão (mostrar modal ou snackbar informativo).
6.  Usar a API Mock fornecida para todas as operações de dados de filmes e autenticação.
7.  A Watchlist pode ser gerenciada localmente (SharedPreferences, SQLite) ou simulando chamadas à API Mock.

**Demandas Funcionais das Páginas:**

1.  **Splash Screen:**
    *   Implementar animações conforme design.
    *   Após a duração, verificar se existe um token/usuário logado (estado local). Se sim, navegar para Home. Senão, navegar para Login.

2.  **Tela de Login:**
    *   Validar formato de email e senha não vazia.
    *   Chamar `POST /login`. Em sucesso, salvar token/user info localmente e navegar para Home. Em erro, mostrar mensagem (Snackbar/Toast).
    *   Implementar funcionalidade de mostrar/ocultar senha.
    *   Navegar para Cadastro ao clicar no link.

3.  **Tela de Cadastro:**
    *   Validar campos (nome não vazio, email válido, senha forte - ex: min 8 chars, 1 num, 1 letra, senha == confirmação).
    *   Chamar `POST /register`. Em sucesso, navegar para Login. Em erro, mostrar mensagem.
    *   Implementar feedback visual da força da senha durante a digitação.

4.  **Tela Principal (Home/Descoberta):**
    *   Chamar `GET /movies/now_playing` e `GET /movies/popular` ao carregar a tela.
    *   Exibir os filmes nos respectivos carrossel/lista.
    *   Implementar funcionalidade da Barra de Pesquisa: ao submeter, chamar `GET /movies/search?query={term}` e exibir resultados (pode ser em um overlay ou navegar para tela de resultados).
    *   Navegar para Detalhes do Filme ao clicar em um pôster.
    *   Abrir o Drawer Menu.

5.  **Tela de Detalhes do Filme:**
    *   Receber `movieId` como parâmetro.
    *   Chamar `GET /movies/{movieId}` para buscar detalhes.
    *   Exibir todas as informações.
    *   Implementar botão "Adicionar/Remover da Watchlist": Verificar se o filme está na watchlist (buscar via `GET /watchlist/{userId}` ou estado local). Chamar `POST` ou `DELETE` na API/estado local. Atualizar visual do botão.
    *   Botão "Trailer" pode abrir um link placeholder ou mostrar mensagem "Trailer indisponível".

6.  **Tela da Watchlist:**
    *   Buscar os `movieId`s da watchlist (`GET /watchlist/{userId}` ou estado local).
    *   Para cada `movieId`, buscar detalhes básicos (talvez um endpoint `GET /movies/batch?ids=...` ou chamadas individuais `GET /movies/{movieId}` - simplificar se necessário) para exibir pôster/título.
    *   Implementar funcionalidade de remoção (chamar `DELETE /watchlist/{userId}/{movieId}` ou atualizar estado local) e atualizar a UI.

7.  **Menu Lateral (Drawer):**
    *   Implementar navegação para Home, Watchlist, etc.
    *   Implementar funcionalidade do Toggle Dark/Light (mudar tema do app e persistir a escolha).
    *   Implementar "Sair": limpar dados locais de usuário/token e navegar para Login.

**Instruções para o Competidor:**
1.  Desenvolva o aplicativo Flutter implementando as funcionalidades descritas.
2.  Garanta que o aplicativo compile e rode em um emulador/dispositivo Android.
3.  Exporte o APK assinado (pode ser debug) com nome `08_Modulo_2_CineFindr_XX.apk`.
4.  Adicione todo o projeto Flutter + o APK exportado a um repositório no servidor GIT com a nomenclatura: `08_Modulo_2_CineFindr_XX_Nome`.

**Esquema de Pontuação (Total 15 pontos - Exemplo):**
*   Demandas Gerais (Estrutura Projeto, Estado, Tema, Tratamento Erros): 2,50
*   Splash Screen (Animação, Lógica Navegação): 1,00
*   Login (Validação, API Call, Navegação, UI): 2,00
*   Cadastro (Validação, API Call, Força Senha, UI): 2,00
*   Home (API Calls, Display Listas, Pesquisa, Navegação): 2,50
*   Detalhes Filme (API Call, Display Info, Watchlist Add/Remove): 2,00
*   Watchlist (Busca Dados, Display, Remoção): 1,50
*   Drawer Menu (Navegação, Tema Toggle, Logout): 1,50
*   Julgamento (Qualidade do código, Performance, UX Funcional): Bônus/Ajuste (até 2,00 )


---
