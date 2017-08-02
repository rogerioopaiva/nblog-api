#language: pt

Funcionalidade: Listar artigos
    Sendo o módulo administrativo do portal nBlog
    Posso solicitar requisicões GET para o serviço posts
    Para listar os artigos do meu blog

    Cenário: Listar artigos

        Quando o módulo admin envia um GET para o serviço posts
        Então o código de reposta HTTP deve ser "200"
            E o JSON response deve conter uma lista de artigos publicados