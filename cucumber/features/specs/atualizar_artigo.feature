#language: pt

@put
Funcionalidade: Atualizar artigo
    Sendo o módulo administrativo do blog
    Posso solicitar requisições PUT para o serviço Posts
    Para atualizar determinado artigo do blog

    @smoke
    Cenario: Atualizar artigo do blog

        Dado que o usuário selecionou um artigo no blog
        Quando o módulo admin envia um PUT para o serviço Posts
        Então o código de resposta deve ser "200"
            E o Json response deve conter os dados atualizados do artigo

    Cenario: Artigo não existe

        Dado que o código do artigo é inválido ou inexistente
        Quando o módulo admin envia um PUT para o serviço Posts
        Então o código de resposta deve ser "404"