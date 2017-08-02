#language: pt

Funcionalidade: Remover artigo
    Sendo o módulo administrativo do portal nBlog
    Posso solicitar requisicões DELETE para o serviço posts
    Para publicar novos artigos no meu blog

    @delete
    Cenário: Remover artigo do blog

        Dado que o usuário selecinou um artigo no blog
        Quando o módulo admin envia um DELETE para o serviço posts
        Então o código de reposta HTTP deve ser "200"