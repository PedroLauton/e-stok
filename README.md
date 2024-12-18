# E-stok

Este repositório contém o código fonte da plataforma E-stok. 

## Sobre o projeto

O E-stok é uma plataforma para cadastro de produtos e lotes, com geração de um QR Code que contém as principais informações nutricionais e a data de validade dos produtos. A intenção é gerar um QR Code que pode ser colado nos produtos, permitindo que o cliente, ao escaneá-lo, salve o produto em sua despensa online. Nesse primeiro momento, será desenvolvida a parte web, responsável pelo cadastro e geração do respectivo QR Code. Posteriormente, será desenvolvido o aplicativo mobile, que incluirá a despensa online e o cadastro automático de produtos com base no QR Code.

## Pré-requisitos

O projeto foi desenvolvido utilizando as seguintes tecnologias e ferramentas:

- **Java** como linguagem principal;
- **Eclipse EE** como IDE principal;
- **Tomcar Server 10.1** como servidor para aplicação;
- **MySql** como banco de dados.

## Clonar o projeto

Para clonar o projeto, basta digitar o seguinte comando no Git Bash: 

```bash
git clone https://github.com/PedroLauton/e-stok.git
```

Caso já tenha o Tomcat Server instalado, basta vincular ao projeto e iniciar. Caso contrário, baixe o Tomcat no seguinte link: 

```bash
https://tomcat.apache.org/download-10.cgi
```

## Estrutura do projeto

Este projeto segue o padrão **Arquitetura em Camadas**, dividindo logicamente o sistema em três camadas: 

- Controller: É a camada mais próxima do usuário que interage com a aplicação. Recebe as requisições HTTP, processa os dados de entrada e delega a lógica de negócios para a camada de serviço, retornando a resposta resposta em Json.  

- Service: Contém a lógica de negócios da aplicação. É a "ponte" entre a camada de Controller e a Repository.

- Repository: Gerencia a interação com o banco de dados. Contém métodos para criar, ler, atualizar e excluir (CRUD) dados do banco.

O projeto utiliza uma **API Rest** para comunicação do Front-end com o Back-end. Os endpoints são mapeados na camada Controller e respondem aos métodos HTTP padrão, como 'GET', 'POST', 'PUT' e 'DELETE'. 

### Implementação do CRUD de Produtos
Na primeira entrega, foi implementado o CRUD de produtos utilizando o endpoint:

- **Endpoint principal**: `/produto`
  - **GET /produto**: Retorna a lista de produtos.
  - **POST /produto**: Cadastra um novo produto.
  - **PUT /produto/editar?{id}**: Atualiza um produto existente pelo ID.
  - **DELETE /produto?{id}**: Remove um produto pelo ID.

## Vídeo (Fase inicial - CRUD do Produto)

https://github.com/user-attachments/assets/04451c3a-f38a-4cdf-8d5f-370c609c7da4


## Contato

Para mais informações, entre em contato:

- GitHub: [Pedro Lauton](https://github.com/PedroLauton)
- GitHub: [Caio Dib](https://github.com/dib10)
