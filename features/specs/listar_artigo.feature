#language: pt

@get
Funcionalidade: Listar artigos
    Sendo o módulo administrativo do blog
    Posso solicitar requisições GET para o serviço Posts
    Para listar os artigos no blog

    @smoke
    Cenário: Listar artigos

        Quando o módulo admin enviar um GET para o serviço Posts
        Então o código de resposta deve ser "200"
            E o Json response deve conter uma lista de artigos

    @error
    Cenário: Listar único artigo

        Dado que o usuário selecionou um artigo para visualização
        Quando o módulo admin eviar um GET desse artigo para o serviço Posts
        Então o código de resposta deve ser "404"
