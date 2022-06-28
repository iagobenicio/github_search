# github_search

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

Projeto Flutter para praticar o que foi estudado sobre Clean Architecture ( Clean Dart ). 

O projeto se trata de pequeno aplicativo para buscar usuários do github e lista-los, apresentando o seu nome, foto de perfil e seu ID. 
Neste projeto foi abordado assuntos sobre Injeção de Dependência, teste unitário e gerenciamento de estado. 

Pacotes utilizados: 

https://pub.dev/packages/dio - Pacote utilizado para consumir a API do github.

https://pub.dev/packages/bloc - Pacote utilizado para gerenciar o estado da aplicação. 

https://pub.dev/packages/get_it - Pacote utilizado para injetar as dependências. 

https://pub.dev/packages/dartz - Pacote utilizado para ajudar a retorna tipos diferentes em metódos, através do Either. Também ajuda na questão de testes unitários. 

https://pub.dev/packages/rxdart - Pacote utilizado para adicionar um debounceTime dentro do bloc, o que cria um delay antes de trazer valor da API, assim contém um econonomia de acesso e evitar rejeição da API. 

https://pub.dev/packages/mocktail - Pacote utilizado para criar Mocks e assim auxiliar nos testes unitários. 
