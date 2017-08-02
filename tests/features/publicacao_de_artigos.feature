#language: pt

Funcionalidade: Publicar artigos
    Sendo o módulo administrativo do portal nBlog
    Posso solicitar requisicões POST, PUT GET e DELETE para o serviço posts
    Para pubicar, atualizar, buscar e apagar artigos do blog

    Cenário: Publicar novo artigo no blog

        Dado que o usuário informou o título e descrição do artigo
        Quando o módulo admin envia um POST para o serviço posts
        Então o código de reposta HTTP deve ser "200"
            E o JSON response deve conter os dados do novo artigo

    Cenário: Atualizar artigo do blog

        Dado que o usuário selecinou um artigo no blog
        Quando o módulo admin envia um PUT para o serviço posts
        Então o código de reposta HTTP deve ser "200"
            E o JSON response deve conter os dados atualizados do artigo

    Cenário: Listar artigos

        Quando o módulo admin envia um GET para o serviço posts
        Então o código de reposta HTTP deve ser "200"
            E o JSON response deve conter uma lista de artigos publicados