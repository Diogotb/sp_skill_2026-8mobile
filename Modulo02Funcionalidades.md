# Plano de Estudo – Módulo 2: Funcionalidades (Lógica e Integração)
## Duração recomendada: 3 semanas (2º ciclo de estudo: 12/05 a 28/05)
## Objetivo Geral:
Capacitar o aluno a desenvolver a lógica e o comportamento funcional dos aplicativos mobile, incluindo navegação, persistência de dados, integração com API e manipulação de estados.

## Conteúdo Programático
### Semana 1 – Lógica de Navegação e Manipulação de Estados
Navegação entre telas (Navigator 1.0 e 2.0)

Passagem de dados entre rotas

Introdução ao Gerenciamento de Estado:

setState, Provider, Riverpod (conceito e uso básico)

Controle de formulários, validação e feedback visual (Snackbar, Dialog, Toast)

### Semana 2 – Integração com APIs e Consumo de Dados
HTTP requests com http ou dio

Consumo de APIs REST externas (JSON)

Conversão de JSON com fromJson e toJson

Criar classes modelo com json_serializable

Exibir dados em listas (ListView, FutureBuilder, RefreshIndicator)

### Semana 3 – Persistência de Dados e Funcionalidades Locais
Armazenamento local com shared_preferences

Banco de dados local com sqflite ou hive

Local notifications (pacote flutter_local_notifications)

Manipulação de arquivos e diretórios (path_provider)

Introdução ao uso da câmera e galeria (image_picker)

### Ferramentas e Bibliotecas Recomendadas

Categoria	                    Ferramentas
Navegação	                    Navigator, go_router
Estado	                        setState, Provider, Riverpod
HTTP & API	                    http, dio, json_serializable
Persistência	                shared_preferences, sqflite, hive
Funcionalidades extras	        image_picker, path_provider, flutter_local_notifications

## Projetos Práticos Propostos
- Projeto 1: App de Anotações com Banco Local
    - Funcionalidades:

        - Criar, editar e excluir anotações

    - Armazenamento com sqflite ou hive

    - Tema escuro/claro (Theme toggle)

    - Objetivos técnicos: manipulação de listas, persistência local, CRUD completo

- Projeto 2: App de Lista de Filmes com Consumo de API
    - Funcionalidades:

        - Listar filmes populares (API TMDB ou OMDB)

    - Buscar por título

    - Detalhes do filme ao clicar no item

    - Objetivos técnicos: consumo de API REST, FutureBuilder, ListView, navegação com parâmetros

- Projeto 3: App de Tarefas com Gerenciamento de Estado
    - Funcionalidades:

    - Adicionar, concluir e excluir tarefas

    - Gerenciamento com Provider

    - Feedback visual (Snackbar, AlertDialog)

    - Objetivos técnicos: manipulação de estado, boas práticas com Provider, uso de eventos

- Projeto 4 (Desafio): App de Perfil com Foto e Armazenamento
    - Funcionalidades:

    - Perfil com nome, email e foto

    - Seleção de imagem da galeria ou câmera (image_picker)

    - Armazenamento com shared_preferences

    - Objetivos técnicos: integração com recursos nativos, armazenamento simples

## Material de Estudo Recomendado
- Artigos e Documentação
Guia de Navegação do Flutter - https://docs.flutter.dev/ui/navigation

Gerenciamento de Estado com Provider – Flutter.dev -https://docs.flutter.dev/data-and-backend/state-mgmt/intro

HTTP requests no Flutter - https://docs.flutter.dev/cookbook/networking/fetch-data

Uso de SQLite com sqflite - https://docs.flutter.dev/cookbook/persistence/sqlite

Flutter Local Notifications - https://pub.dev/packages/flutter_local_notifications

- Cursos e Tutoriais
YouTube - Flutterando: APIs REST, Provider, Persistência local

YouTube - Johann Milke: Projetos completos com integração e design

Curso gratuito: App de Filmes com API - Balta.io (YouTube) - https://www.youtube.com/watch?v=dA8Bbzw0_lo&list=PLHlHvK2lnJndhgbqLl5DNEvKQg5F4ZenQ

