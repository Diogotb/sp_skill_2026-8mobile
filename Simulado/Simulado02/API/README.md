# Simulado02 API – Guia Rápido

Este projeto utiliza o [json-server](https://github.com/typicode/json-server) para simular uma API RESTful baseada em um arquivo `db.json`.

## Pré-requisitos

- [Node.js](https://nodejs.org/)
- [json-server](https://www.npmjs.com/package/json-server) instalado globalmente:
    ```bash
    npm install -g json-server
    ```

## Como Usar

1. Salve o arquivo de dados como `db.json` na raiz do projeto.
2. Inicie o servidor:
     ```bash
     json-server --watch db.json
     ```
3. Acesse os endpoints disponíveis em `http://localhost:3000`.

## Exemplos de Endpoints

- Listar todas as obras de arte:
    ```
    GET /artworks
    ```
- Listar obras em destaque:
    ```
    GET /artworks?isFeatured=true
    ```
- Listar obras de um artista específico:
    ```
    GET /artworks?artistId=401
    ```
- Detalhes de um artista:
    ```
    GET /artists/402
    ```
- Exibições em andamento:
    ```
    GET /exhibitions?status=current
    ```
- Favoritos de um usuário:
    ```
    GET /user_favorites?userId=1
    ```
- Coleções de um usuário:
    ```
    GET /user_collections?userId=1
    ```

## Atualizando Coleções

Para adicionar uma obra a uma coleção existente, envie um `PUT` para `/user_collections/{collectionId}` atualizando o array `artworkIds`.

## Observações

- Consulte a [documentação oficial do json-server](https://github.com/typicode/json-server) para mais opções e customizações.
- Os dados são armazenados localmente e não persistem entre reinicializações do servidor, a menos que salvos em `db.json`.
