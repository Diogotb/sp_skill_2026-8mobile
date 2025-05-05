aqui está um arquivo `db.json` que você pode usar com `json-server` para simular a API do CineFindr localmente. Ele inclui estruturas para usuários, filmes e a watchlist, com dados de exemplo.

**Arquivo: `db.json`**

```json
{
    "users": [
      {
        "id": 1,
        "name": "Usuário Exemplo",
        "email": "usuario@email.com",
        "password": "password123"
      }
    ],
    "movies": [
      {
        "id": 201,
        "title": "The Shawshank Redemption (Um Sonho de Liberdade)",
        "posterUrl": "https://image.tmdb.org/t/p/w500/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
        "rating": 9.3,
        "duration": "2h 22min",
        "genres": ["Drama", "Crime"],
        "overview": "Condenado pelo assassinato de sua esposa e do amante dela, um banqueiro passa quase vinte anos na prisão de Shawshank, onde desenvolve uma forte amizade com outro detento.",
        "trailerUrl": "https://www.youtube.com/watch?v=PLl99DlL6b4",
        "isNowPlaying": false,
        "isPopular": true
      },
      {
        "id": 202,
        "title": "The Godfather (O Poderoso Chefão)",
        "posterUrl": "https://image.tmdb.org/t/p/w500/3bhkrj58Vtu7gcYsTvUC2x51fsJ.jpg",
        "rating": 9.2,
        "duration": "2h 55min",
        "genres": ["Drama", "Crime"],
        "overview": "O patriarca de uma poderosa família do crime organizado transfere o controle de seu império clandestino para seu relutante filho.",
        "trailerUrl": "https://www.youtube.com/watch?v=sY1S34973zA",
        "isNowPlaying": false,
        "isPopular": true
      },
      {
        "id": 203,
        "title": "The Dark Knight (Batman: O Cavaleiro das Trevas)",
        "posterUrl": "https://image.tmdb.org/t/p/w500/pKKvCaL1TPTVtbSq2yiJXGmd3be.jpg",
        "rating": 9.0,
        "duration": "2h 32min",
        "genres": ["Drama", "Ação", "Crime", "Suspense"],
        "overview": "Quando a ameaça conhecida como Coringa emerge de seu passado misterioso, ele causa estragos e caos sobre o povo de Gotham. O Cavaleiro das Trevas deve aceitar um dos maiores testes psicológicos e físicos de sua capacidade de lutar contra a injustiça.",
        "trailerUrl": "https://www.youtube.com/watch?v=EXeTwQWrcwY",
        "isNowPlaying": true,
        "isPopular": true
      },
      {
        "id": 204,
        "title": "The Godfather Part II (O Poderoso Chefão II)",
        "posterUrl": "https://image.tmdb.org/t/p/w500/hek3koDUyRQk7FIhPXsa6mT2Zc3.jpg",
        "rating": 9.0,
        "duration": "3h 22min",
        "genres": ["Drama", "Crime"],
        "overview": "Acompanha a vida pregressa e carreira de Vito Corleone na Nova York dos anos 1920, enquanto seu filho, Michael, expande e consolida seu controle sobre o sindicato do crime da família.",
        "trailerUrl": "https://www.youtube.com/watch?v=9O1Iy9od7-A",
        "isNowPlaying": false,
        "isPopular": true
      },
      {
        "id": 205,
        "title": "12 Angry Men (12 Homens e uma Sentença)",
        "posterUrl": "https://image.tmdb.org/t/p/w500/70dpNhH4QCG0XEryctx1ZVpCUf4.jpg",
        "rating": 9.0,
        "duration": "1h 36min",
        "genres": ["Drama"],
        "overview": "Um jurado dissidente tenta impedir um erro judiciário, forçando seus colegas a reconsiderarem as evidências em um julgamento de assassinato.",
        "trailerUrl": "https://www.youtube.com/watch?v=TEN-2uTi2c0",
        "isNowPlaying": false,
        "isPopular": false
      },
      {
        "id": 206,
        "title": "Schindler's List (A Lista de Schindler)",
        "posterUrl": "https://image.tmdb.org/t/p/w500/sF1U4EUQS8YHUYjNl3pMGNIQyr0.jpg",
        "rating": 8.9,
        "duration": "3h 15min",
        "genres": ["Drama", "História", "Guerra"],
        "overview": "Na Polônia ocupada pelos alemães durante a Segunda Guerra Mundial, o industrial Oskar Schindler gradualmente se preocupa com sua força de trabalho judaica após testemunhar sua perseguição pelos nazistas.",
        "trailerUrl": "https://www.youtube.com/watch?v=gG22XNhtnoY",
        "isNowPlaying": false,
        "isPopular": true
      },
      {
        "id": 207,
        "title": "The Lord of the Rings: The Return of the King (O Senhor dos Anéis: O Retorno do Rei)",
        "posterUrl": "https://image.tmdb.org/t/p/w500/rCzpDGLbOoPwLjy3OAm5NUPOTrC.jpg",
        "rating": 8.9,
        "duration": "3h 21min",
        "genres": ["Aventura", "Fantasia", "Ação"],
        "overview": "Gandalf e Aragorn lideram o Mundo dos Homens contra o exército de Sauron para desviar seu olhar de Frodo e Sam enquanto eles se aproximam da Montanha da Perdição com o Um Anel.",
        "trailerUrl": "https://www.youtube.com/watch?v=r5X-hFf6Bwo",
        "isNowPlaying": false,
        "isPopular": true
      },
      {
        "id": 208,
        "title": "Pulp Fiction",
        "posterUrl": "https://image.tmdb.org/t/p/w500/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg",
        "rating": 8.9,
        "duration": "2h 34min",
        "genres": ["Suspense", "Crime"],
        "overview": "As vidas de dois assassinos de aluguel, um boxeador, a esposa de um gângster e um casal de bandidos de lanchonete se entrelaçam em quatro contos de violência e redenção.",
        "trailerUrl": "https://www.youtube.com/watch?v=s7EdQ4FqbhY",
        "isNowPlaying": false,
        "isPopular": true
      },
      {
         "id": 209,
         "title": "The Lord of the Rings: The Fellowship of the Ring (O Senhor dos Anéis: A Sociedade do Anel)",
         "posterUrl": "https://image.tmdb.org/t/p/w500/6oom5QYQ2yQTMJIbnvbkBL9cHo6.jpg",
         "rating": 8.8,
         "duration": "2h 58min",
         "genres": ["Aventura", "Fantasia", "Ação"],
         "overview": "Um hobbit pacato da Comarca e oito companheiros partem em uma jornada para destruir o poderoso Um Anel e salvar a Terra-média do Lorde das Trevas Sauron.",
         "trailerUrl": "https://www.youtube.com/watch?v=V75dMMIW2B4",
         "isNowPlaying": false,
         "isPopular": true
       },
      {
        "id": 210,
        "title": "The Good, the Bad and the Ugly (Três Homens em Conflito)",
        "posterUrl": "https://image.tmdb.org/t/p/w500/bX2xnavhMYjWDoZp1VM6VnU1xwe.jpg",
        "rating": 8.8,
        "duration": "2h 58min",
        "genres": ["Western"],
        "overview": "Um caçador de recompensas misterioso, um fora-da-lei mexicano e um mercenário calculista competem para encontrar uma fortuna em ouro enterrado em meio ao caos da Guerra Civil Americana.",
        "trailerUrl": "https://www.youtube.com/watch?v=WCN5JJY_wiA",
        "isNowPlaying": false,
        "isPopular": false
      }
    ],
    "watchlists": [
      
    ]
}

```

**Como Usar com `json-server`:**

1.  **Instale `json-server`** (se ainda não tiver):
    ```bash
    npm install -g json-server
    ```
    ou
    ```bash
    yarn global add json-server
    ```

2.  **Salve** o conteúdo JSON acima em um arquivo chamado `db.json`.

3.  **Execute `json-server`** no mesmo diretório onde você salvou o arquivo:
    ```bash
    json-server --watch db.json
    ```

4.  **Acesse os Endpoints:** `json-server` iniciará um servidor local (geralmente na porta 3000). Você pode agora fazer requisições para os seguintes endpoints (simulados) a partir do seu aplicativo Flutter:

    *   **Login (Simulado):** `GET /users?email=usuario@email.com&password=password123` (Se retornar um usuário, o login é "válido").
    *   **Register:** `POST /users` com o body `{ "name": "Novo User", "email": "novo@email.com", "password": "newpass" }`.
    *   **Now Playing:** `GET /movies?isNowPlaying=true`
    *   **Popular:** `GET /movies?isPopular=true`
    *   **Search:** `GET /movies?title_like=Jornada` (use `_like` para busca parcial).
    *   **Movie Details:** `GET /movies/101`
    *   **Get Watchlist:** `GET /watchlists?userId=1` (Retorna as *entradas* da watchlist para o usuário 1).
    *   **Add to Watchlist:** `POST /watchlists` com o body `{ "userId": 1, "movieId": 105 }`.
    *   **Remove from Watchlist:** `DELETE /watchlists/{watchlist_entry_id}` (Ex: `DELETE /watchlists/2` remove a entrada com `id: 2`. Você precisará primeiro buscar a entrada correta usando `GET /watchlists?userId=1&movieId=103` para obter o `id` da entrada a ser deletada).

Este `db.json` fornece uma base sólida para desenvolver e testar as funcionalidades do aplicativo CineFindr localmente. Lembre-se da simulação do login e da lógica necessária no Flutter para remover itens da watchlist.