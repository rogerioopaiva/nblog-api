#language: pt

Funcionalidade: Publicar artigo
    Sendo o módulo administrativo do portal nBlog
    Posso solicitar requisicões POST para o serviço posts
    Para publicar novos artigos no meu blog

    Cenário: Publicar novo artigo no blog

        Dado que o usuário informou o título e descrição do artigo
        Quando o módulo admin envia um POST para o serviço posts
        Então o código de reposta HTTP deve ser "200"
            E o JSON response deve conter os dados do novo artigo
