#language: pt

Funcionalidade: Atualizar artigo
    Sendo o módulo administrativo do portal nBlog
    Posso solicitar requisicões PUT para o serviço posts
    Para atualizar um artigo desejado no meu blog

    Cenário: Atualizar artigo do blog

        Dado que o usuário selecinou um artigo no blog
        Quando o módulo admin envia um PUT para o serviço posts
        Então o código de reposta HTTP deve ser "200"
            E o JSON response deve conter os dados atualizados do artigo
