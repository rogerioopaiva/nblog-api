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