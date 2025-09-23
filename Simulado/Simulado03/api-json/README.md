
### **Tutorial Completo: Simulando uma API REST com `json-server`**

#### **O que é o `json-server`?**

`json-server` é uma ferramenta fantástica que cria uma API RESTful completa com zero codificação em menos de 30 segundos. Ele usa um simples arquivo de texto no formato JSON (`.json`) como um banco de dados e gera automaticamente todos os endpoints necessários para ler, criar, atualizar e deletar dados (operações CRUD).

É perfeito para desenvolvedores front-end e mobile que precisam de um backend funcional para testar suas aplicações sem ter que construir um do zero.

---

### **Passo 1: Pré-requisitos (Instalando o Node.js e NPM)**

O `json-server` é um pacote do **Node.js**, então você precisa ter o Node.js e o NPM (Node Package Manager) instalados na sua máquina.

1.  **Verifique se você já tem:**
    Abra o seu terminal (CMD, PowerShell, Git Bash no Windows, ou Terminal no macOS/Linux) e digite os seguintes comandos:
    ```bash
    node -v
    npm -v
    ```
    Se ambos os comandos retornarem números de versão (ex: `v18.17.1` e `9.6.7`), você já os tem instalados e pode pular para o Passo 2.

2.  **Se não tiver, instale:**
    *   Acesse o site oficial do Node.js: [https://nodejs.org/](https://nodejs.org/)
    *   Baixe a versão **LTS** (Long Term Support), que é a mais estável.
    *   Execute o instalador e siga as instruções, mantendo as opções padrão. O NPM será instalado automaticamente junto com o Node.js.
    *   Após a instalação, feche e reabra seu terminal e verifique as versões novamente para confirmar.

---

### **Passo 2: Instalando o `json-server`**

Com o Node.js e NPM prontos, a instalação do `json-server` é feita com um único comando no terminal.

*   Recomendamos instalá-lo **globalmente** para que você possa usá-lo em qualquer pasta do seu computador. Use a flag `-g` (global).

    ```bash
    npm install -g json-server
    ```

*   **Aguarde a instalação terminar.** Se você encontrar um erro de permissão (comum no macOS/Linux), talvez precise usar `sudo`:
    ```bash
    sudo npm install -g json-server
    ```

*   **Verifique a instalação:**
    ```bash
    json-server --version
    ```
    Se ele retornar um número de versão, a instalação foi bem-sucedida!

---

### **Passo 3: Criando seu Banco de Dados (Arquivo `db.json`)**

O coração do `json-server` é o arquivo JSON que define seus dados e endpoints.

1.  **Crie uma pasta para seu projeto de API mock:**
    ```bash
    mkdir fit-trackr-api
    cd fit-trackr-api
    ```

2.  **Crie um arquivo chamado `db.json`** dentro dessa pasta. Você pode usar um editor de código como o VS Code, Sublime Text, ou qualquer editor de texto simples.

3.  **Adicione seus dados ao arquivo.** A estrutura é simples: o objeto principal contém "chaves" que se tornarão seus endpoints. Cada chave aponta para um array de objetos.

    **Exemplo para o FitTrackr (`db.json`):**

    ```json
    {
      "users": [
        {
          "id": 1,
          "name": "Carlos Silva",
          "email": "carlos@email.com",
          "password": "password123",
          "goals": {
            "dailySteps": 10000,
            "dailyCaloriesBurn": 500
          }
        }
      ],
      "activities": [
        {
          "id": 101,
          "userId": 1,
          "type": "Corrida",
          "duration": "00:30:00",
          "caloriesBurned": 350,
          "date": "2024-05-20T08:00:00Z"
        }
      ],
      "foods": [
        { "id": 301, "name": "Ovo Cozido", "caloriesPerUnit": 78 },
        { "id": 302, "name": "Peito de Frango Grelhado (100g)", "caloriesPerUnit": 165 }
      ]
    }
    ```

**IMPORTANTE:**
*   `json-server` usa a chave `"id"` para identificar cada registro de forma única. Ele pode gerar IDs automaticamente se você não os fornecer ao criar novos registros.
*   Relacionamentos são feitos automaticamente. Como o objeto de atividade tem um `"userId"`, o `json-server` entende que atividades pertencem a usuários.

---

### **Passo 4: Iniciando o Servidor**

Agora vem a mágica! Com seu arquivo `db.json` pronto, inicie o servidor.

1.  **Navegue até a pasta** onde você salvou o `db.json` pelo terminal.

2.  **Execute o comando:**
    ```bash
    json-server --watch db.json
    ```
    *   `--watch`: Este comando mágico diz ao servidor para "observar" o arquivo `db.json`. Qualquer alteração que sua aplicação fizer via API (POST, PUT, DELETE) será salva **automaticamente** no arquivo!

3.  **Observe a saída no terminal.** Você verá algo assim:

    ```
      \{^_^}/ hi!

      Loading db.json
      Done

      Resources
      http://localhost:3000/users
      http://localhost:3000/activities
      http://localhost:3000/foods

      Home
      http://localhost:3000

      Type s + enter at any time to create a snapshot of the database
    ```

**Seu servidor está no ar!** A API está acessível em `http://localhost:3000`.

---

### **Passo 5: Utilizando os Endpoints da API**

Agora você pode usar qualquer cliente HTTP (seu aplicativo Flutter, Postman, Insomnia, ou até mesmo o navegador) para interagir com a API.

#### **Operações de Leitura (GET)**

*   **Listar todos os recursos:**
    *   `http://localhost:3000/users` -> Retorna todos os usuários.
    *   `http://localhost:3000/activities` -> Retorna todas as atividades.

*   **Buscar um recurso por ID:**
    *   `http://localhost:3000/users/1` -> Retorna o usuário com `id: 1`.

*   **Filtrar:**
    *   `http://localhost:3000/users?email=carlos@email.com` -> Busca usuários com aquele email exato.

*   **Buscar por texto (like):**
    *   `http://localhost:3000/foods?name_like=Frango` -> Busca alimentos cujo nome contém "Frango".

*   **Listar recursos relacionados:**
    *   `http://localhost:3000/activities?userId=1` -> Retorna todas as atividades do usuário com `id: 1`.
    *   `http://localhost:3000/users/1/activities` -> Outra forma de fazer a mesma coisa!

*   **Ordenar:**
    *   `http://localhost:3000/activities?_sort=date&_order=desc` -> Ordena as atividades pela data, da mais recente para a mais antiga.

#### **Operações de Escrita (POST, PUT, PATCH, DELETE)**

*   **Criar um novo recurso (POST):**
    *   Envie uma requisição `POST` para `http://localhost:3000/activities` com o `body` em JSON:
        ```json
        {
          "userId": 1,
          "type": "Ciclismo",
          "duration": "01:00:00",
          "caloriesBurned": 500,
          "date": "2024-05-21T18:00:00Z"
        }
        ```
    *   `json-server` irá adicionar este novo objeto ao array `activities` no seu `db.json` e atribuir um `id` automaticamente.

*   **Atualizar um recurso completo (PUT):**
    *   Envie uma requisição `PUT` para `http://localhost:3000/activities/101`. O `body` deve conter o objeto **completo** com as alterações.

*   **Atualizar um recurso parcialmente (PATCH):**
    *   Envie uma requisição `PATCH` para `http://localhost:3000/users/1`. O `body` precisa ter apenas os campos que você quer mudar:
        ```json
        {
          "goals": { "dailySteps": 12000 }
        }
        ```

*   **Deletar um recurso (DELETE):**
    *   Envie uma requisição `DELETE` para `http://localhost:3000/activities/101`.

---

### **Dica Extra: Acessando de um Emulador Mobile**

Se você estiver rodando o `json-server` no seu computador e seu aplicativo Flutter no emulador Android, `localhost` (ou `127.0.0.1`) dentro do emulador aponta para o próprio emulador, não para o seu computador!

Para que o emulador acesse o `json-server` do seu PC, use o endereço IP especial **`10.0.2.2`**.

*   Sua URL da API no Flutter seria: `http://10.0.2.2:3000/`

Para iOS Simulator, `localhost` geralmente funciona. Se não, use o endereço IP da sua máquina na rede local (ex: `http://192.168.1.10:3000/`).
