O

**Tema do Simulado:** **"ArtGallery Explorer" - Um Aplicativo para Explorar Obras de Arte e Exposições**

Este simulado manterá a estrutura e complexidade dos módulos anteriores, mas adaptado para uma interface de tablet, que geralmente permite mais informações na tela e interações diferentes.

---

**Simulado - Projeto Teste (Skill 08 - Desenvolvimento de Aplicativos Móveis - FOCO TABLET)**

**Aplicativo:** ArtGallery Explorer

**Descrição Geral:** ArtGallery Explorer é um aplicativo para tablets que permite aos usuários descobrir obras de arte famosas, aprender sobre artistas e explorar exposições virtuais de diferentes galerias e museus. Os usuários podem salvar suas obras favoritas e criar coleções personalizadas.

**Tecnologias Base (conforme Descritivo Técnico e exemplos):**
*   **Design:** Figma
*   **Desenvolvimento:** Flutter (utilizando SDK e bibliotecas padrão/comuns)
*   **API:** Uma API Mock fornecida (descrita no Módulo 2) para dados de obras de arte, artistas e exposições.
*   **Versionamento:** Git

---

**Módulo 1: ArtGallery Explorer - Design (Simulação de Módulo A1 - FOCO TABLET)**

**Duração:** 3 Horas
**Ferramenta:** Figma
**Dispositivo Alvo do Design:** Tablet (Ex: Figma Frame "Surface Pro 8" ou similar - ~1280x800 ou maior)
**Dia:** 1 – Manhã (A.M.)

**Introdução:**
Você é o designer UI/UX encarregado de criar a interface do aplicativo ArtGallery Explorer para tablets. Sua tarefa é desenvolver um design que aproveite o espaço maior da tela do tablet, oferecendo uma experiência imersiva e informativa para explorar arte. Siga as diretrizes de estilo e os requisitos gerais.

**Demandas Gerais:**
1.  Todos os textos devem ser exatamente como especificados nas descrições das telas.
2.  O protótipo deve seguir padrões de acessibilidade (contraste, tamanho de fonte adequado para leitura em tablet).
3.  Todas as páginas devem ter melhorias de design em relação aos wireframes conceituais, focando na experiência do usuário em tablet (ex: layouts de duas colunas, painéis laterais, etc.).
4.  Use os recursos gráficos fornecidos em `media-files` (simulado) ou crie/encontre os seus (royalty-free).
5.  Navegação funcional entre todas as telas e botões interativos no protótipo Figma.
6.  Opção de troca de tema **dark/light mode** acessível (ex: nas configurações). O design deve apresentar *ambos* os temas aplicados consistentemente.
7.  Adicione **pelo menos 1 nova tela ou funcionalidade de painel** não descrita nos wireframes, que aproveite o espaço do tablet (ex: um painel de "Notas do Curador" na tela de detalhes da obra, uma tela de "Timeline de Artistas").
8.  Siga a guia de estilos abaixo:

    *   **LOGOTIPO:** (Criar um logo para "ArtGallery Explorer" - ex: moldura de quadro estilizada + lupa ou um monograma "AGE")
    *   **ÍCONE DO APLICATIVO:** (Versão simplificada do logo)
    *   **CORES:**
        *   Primária: #4A4A4A (Cinza Escuro Sofisticado)
        *   Secundária: #C0A062 (Dourado Envelhecido)
        *   Acento: #800020 (Borgonha/Vinho)
        *   Fundo (Light): #FDFBF6 (Branco Pergaminho)
        *   Fundo (Dark): #2C2C2C (Cinza Muito Escuro)
        *   Texto Principal (Light): #333333 (Cinza Grafite)
        *   Texto Principal (Dark): #E0E0E0 (Cinza Claro)
    *   **TIPOGRAFIA:**
        *   Títulos Principais: Merriweather Bold - 28px / 32px (Fonte Serifada Elegante)
        *   Subtítulos/Títulos de Seção: Lato Regular - 20px / 22px (Fonte Sans-Serif Limpa)
        *   Corpo: Lato Regular - 16px / 18px
        *   Legendas/Notas: Lato Italic - 14px

**Demandas das Páginas (Wireframes Conceituais para Tablet):**

1.  **Splash Screen:**
    *   *Componentes:* Logo do ArtGallery Explorer.
    *   *Requisitos:* Duração de 3-5 segundos. Animação elegante do logo (ex: revelação gradual, transição suave).

2.  **Tela Principal (Dashboard/Explorar):**
    *   *Layout:* Layout de duas ou três colunas.
    *   *Coluna/Painel Esquerdo (Navegação):* Pode ser uma barra lateral fixa com ícones e/ou texto para "Explorar", "Artistas", "Exposições", "Minhas Coleções", "Favoritos", "Configurações".
    *   *Área de Conteúdo Principal:*
        *   Seção "Obras em Destaque": Grid grande com 2-3 obras em destaque (imagem grande, título, artista).
        *   Seção "Exposições Atuais": Carrossel horizontal de banners de exposições.
        *   Seção "Artistas para Descobrir": Lista ou grid menor de retratos/obras de artistas com seus nomes.
    *   *Topo:* Barra de Pesquisa proeminente.

3.  **Tela de Detalhes da Obra de Arte:**
    *   *Layout:* Pode usar um layout de painel dividido ou um design onde a imagem da obra é central e dominante.
    *   *Painel Esquerdo (ou área principal):* Imagem da obra de arte em alta resolução, com capacidade de zoom (indicar no design).
    *   *Painel Direito (ou área secundária):* Título da Obra, Nome do Artista (clicável para ir à tela do artista), Ano, Técnica/Materiais, Dimensões, Descrição detalhada da obra, Galeria/Museu onde está. Botão "Salvar nos Favoritos" (com estado ativo/inativo), Botão "Adicionar à Coleção".
    *   *Sua tela/painel extra:* (Ex: "Notas do Curador" com informações adicionais, ou "Obras Relacionadas").

4.  **Tela de Lista de Artistas:**
    *   *Layout:* Grid de artistas.
    *   *Cada Item do Grid:* Foto/Retrato do Artista, Nome do Artista, Período/Movimento Artístico.
    *   *Topo:* Filtros (Ex: por período, por movimento artístico, por nacionalidade).

5.  **Tela de Detalhes do Artista:**
    *   *Layout:* Similar à tela de detalhes da obra, com um cabeçalho proeminente.
    *   *Cabeçalho:* Foto/Retrato do Artista, Nome, Datas de Nascimento/Morte, Nacionalidade.
    *   *Corpo:* Biografia detalhada. Seção "Obras Notáveis" (um carrossel ou grid pequeno das obras do artista presentes no app, clicáveis).

6.  **Tela de Exposições:**
    *   *Layout:* Lista vertical de exposições.
    *   *Cada Item da Lista:* Banner/Imagem da Exposição, Título da Exposição, Galeria/Museu, Datas.
    *   *Topo:* Filtro (Ex: "Atuais", "Passadas", "Próximas").

7.  **Tela de Detalhes da Exposição:**
    *   *Layout:* Layout imersivo.
    *   *Cabeçalho:* Imagem/Banner grande da exposição, Título, Datas, Galeria/Museu.
    *   *Corpo:* Descrição da exposição. Seção "Obras na Exposição" (grid das obras incluídas, clicáveis para detalhes da obra). Mapa interativo da galeria (placeholder visual).

8.  **Tela "Minhas Coleções":**
    *   *Layout:* Grid de coleções criadas pelo usuário.
    *   *Cada Item do Grid:* Nome da Coleção, Imagem de capa (pode ser a primeira obra adicionada ou customizada), Número de obras.
    *   *Funcionalidade:* Botão para "Criar Nova Coleção".

9.  **Tela de Detalhes da Coleção:**
    *   *Layout:* Grid de obras dentro da coleção específica.
    *   *Topo:* Nome da Coleção (editável), Descrição (opcional).
    *   *Funcionalidade:* Opção para remover obras da coleção.

10. **Tela "Favoritos":**
    *   *Layout:* Grid das obras de arte que o usuário marcou como favoritas. Similar à visualização de obras, mas apenas com as favoritas.

**Instruções para o Competidor (Módulo 1):**
1.  Crie o projeto no Figma com todas as telas e interações descritas, focado no layout para Tablet.
2.  Implemente os temas Dark e Light.
3.  Exporte o link do protótipo Figma funcional.
4.  Adicione o arquivo Figma (`.fig`) a um repositório no servidor GIT com a nomenclatura: `08_Modulo_1_ArtGallery_Tablet_XX_Nome`.

**Esquema de Pontuação (Módulo 1 - Total 15 pontos - Exemplo):**
*   Demandas Gerais (Estilo, Acessibilidade Tablet, Dark/Light, Nova Tela, Navegação): 3,50
*   Splash Screen: 0,50
*   Tela Principal (Layout Tablet, Navegação Lateral, Grids): 2,50
*   Detalhes da Obra (Layout Tablet, Zoom, Informações): 2,50
*   Listas e Detalhes (Artistas, Exposições - consistência, filtros): 3,00
*   Coleções e Favoritos (Criação, Visualização): 2,00
*   Julgamento (Qualidade Design Tablet, UX, Melhorias): 1,00

---

**Módulo 2: ArtGallery Explorer - Funcionalidades (Simulação de Módulo B1 - FOCO TABLET)**

**Duração:** 3 Horas
**Ferramenta:** Flutter (com Android Studio/VS Code)
**Dispositivo Alvo da Execução:** Emulador de Tablet Android ou iPad (se configurado).
**Dia:** 2 – Manhã (A.M.)

**Introdução:**
Com base no design para tablet criado no Módulo 1, sua tarefa é implementar a funcionalidade do aplicativo ArtGallery Explorer usando Flutter. Você se conectará a uma API Mock para buscar dados de arte e gerenciar coleções/favoritos (simulados localmente ou via mock API).

**API Mock (Simulada - Endpoints Esperados para ArtGallery):**
*   `GET /artworks` (com filtros opcionais: `?isFeatured=true`, `?artistId={id}`, `?exhibitionId={id}`)
*   `GET /artworks/{artworkId}`
*   `GET /artists` (com filtros opcionais)
*   `GET /artists/{artistId}`
*   `GET /exhibitions` (com filtros opcionais: `?status=current|past|upcoming`)
*   `GET /exhibitions/{exhibitionId}`
*   (Para Favoritos/Coleções - pode ser gerenciado localmente ou com endpoints simples como:)
*   `GET /user/{userId}/favorites` -> [{artworkId}]
*   `POST /user/{userId}/favorites` (body: {artworkId})
*   `DELETE /user/{userId}/favorites/{artworkId}`
*   `GET /user/{userId}/collections` -> [{id, name, coverImageUrl, artworkIds[]}]
*   `POST /user/{userId}/collections` (body: {name, description}) -> {id, name, ...}
*   `PUT /user/{userId}/collections/{collectionId}` (body: {name, description, artworkIds[]}) (para adicionar/remover obras)
*   `DELETE /user/{userId}/collections/{collectionId}`

**Demandas Gerais:**
1.  Implementar a interface o mais próximo possível do design para tablet do Módulo 1, utilizando widgets que se adaptam bem a telas maiores (ex: `GridView`, `Row`, `Expanded`, `SplitView` se necessário).
2.  Gerenciar o estado do aplicativo (Provider, Riverpod, BLoC, GetX).
3.  Implementar a navegação entre telas.
4.  Implementar a troca de tema Dark/Light funcionalmente.
5.  Tratar erros de API e falta de conexão.

**Demandas Funcionais das Páginas (FOCO TABLET):**

1.  **Tela Principal (Dashboard/Explorar):**
    *   Carregar e exibir Obras em Destaque, Exposições Atuais, Artistas.
    *   Funcionalidade da barra de pesquisa (filtrar obras/artistas/exposições).
    *   Navegação lateral funcional.

2.  **Tela de Detalhes da Obra de Arte:**
    *   Carregar e exibir todos os detalhes da obra, incluindo a imagem grande.
    *   Implementar funcionalidade de "Salvar nos Favoritos" (atualizar estado e UI).
    *   Implementar "Adicionar à Coleção" (abrir um modal/dialog para selecionar uma coleção existente ou criar uma nova).

3.  **Listas e Detalhes (Artistas, Exposições):**
    *   Carregar e exibir listas de artistas/exposições.
    *   Permitir navegação para as respectivas telas de detalhes.
    *   Funcionalidade básica dos filtros.

4.  **Minhas Coleções e Detalhes da Coleção:**
    *   Permitir ao usuário criar novas coleções (nome, opcionalmente descrição).
    *   Exibir coleções existentes.
    *   Ao visualizar uma coleção, exibir as obras nela contidas.
    *   Permitir remover obras de uma coleção e deletar uma coleção inteira.

5.  **Favoritos:**
    *   Exibir todas as obras marcadas como favoritas.
    *   Permitir remover uma obra dos favoritos a partir desta tela.

**Instruções para o Competidor (Módulo 2):**
1.  Desenvolva o aplicativo Flutter.
2.  Garanta que o aplicativo compile e rode em um emulador de Tablet.
3.  Exporte o APK assinado (debug) com nome `08_Modulo_2_ArtGallery_Tablet_XX.apk`.
4.  Adicione todo o projeto Flutter + o APK exportado ao GIT: `08_Modulo_2_ArtGallery_Tablet_XX_Nome`.

**Esquema de Pontuação (Módulo 2 - Total 15 pontos - Exemplo):**
*   Demandas Gerais (Estrutura Projeto Tablet, Estado, Tema, Erros): 2,50
*   Tela Principal (Layout Tablet, APIs, Pesquisa, Navegação Lateral): 3,00
*   Detalhes da Obra (API, Favoritos, Add Coleção, UI Tablet): 3,00
*   Listas e Detalhes Artistas/Exposições (APIs, Filtros, UI Tablet): 2,50
*   Coleções (CRUD Coleções, Add/Remove Obras, UI Tablet): 3,00
*   Favoritos (Display, Remoção, UI Tablet): 1,00
*   Julgamento (Qualidade código Tablet, Performance, UX Funcional): Bônus/Ajuste

---

**`media-files` Simulados para ArtGallery Explorer:**

1.  `logo_artgallery.png`
2.  `logo_artgallery_simple.png`
3.  `icon_artgallery.png`
4.  `artwork_featured_1.jpg` (Imagem de obra de arte famosa, ex: Monalisa)
5.  `artwork_featured_2.jpg` (Outra obra famosa, ex: Noite Estrelada)
6.  `artwork_general_1.jpg` a `artwork_general_10.jpg` (Imagens variadas de obras de arte, royalty-free de museus ou Unsplash/Pexels com tema artístico)
7.  `artist_portrait_1.jpg` (Retrato de artista famoso, ex: Van Gogh)
8.  `artist_portrait_2.jpg` (Outro artista, ex: Da Vinci)
9.  `exhibition_banner_1.jpg` (Banner conceitual para uma exposição)
10. `exhibition_banner_2.jpg`
11. `gallery_map_placeholder.png` (Placeholder para mapa da galeria)

Lembre-se de usar imagens royalty-free ou de domínio público para os arquivos de arte e artistas. Sites de museus como o MET, Rijksmuseum, Art Institute of Chicago geralmente têm seções de imagens de domínio público.

Este simulado focado em tablet desafiará o aluno a pensar sobre layouts responsivos e como apresentar informações de forma eficaz em telas maiores.