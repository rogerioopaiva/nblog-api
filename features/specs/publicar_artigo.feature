#language: pt

@post
Funcionalidade: Publicar artigo
    Sendo o módulo administrativo do blog
    Posso solicitar requisições POST para o serviço Posts
    Para publicar novos artigos no blog

    @smoke
    Cenario: Publicar novo artigo no blog

        Dado que o usuário informou o título e descrição do artigo
        Quando o módulo de cadastro envia um POST para o serviço Posts
        Então o código de resposta deve ser "200"
            E o Json response deve conter os dados do novo artigo