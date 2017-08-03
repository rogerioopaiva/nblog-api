# encoding: utf-8

# POST

Dado(/^que o usuário informou o título e descrição do artigo$/) do
  @req = {
    title: 'Executando Testes no Capybara com Chrome Headless',
    image: 'http://qaninja.com.br/static/nblog/headless.png',
    body: get_details
  }
end

Quando(/^o módulo admin envia um POST para o serviço posts$/) do
  post '/api/posts', @req.to_json
end

Então(/^o código de reposta HTTP deve ser "([^"]*)"$/) do |status_code|
  expect_status(status_code)
end

Então(/^o JSON response deve conter os dados do novo artigo$/) do
  get '/api/posts/' + headers[:_id]
  expect(json_body).to include(title: @req[:title], body: @req[:body])
end

# PUT

Dado(/^que o usuário selecinou um artigo no blog$/) do
  steps %(
    Dado que o usuário informou o título e descrição do artigo
    Quando o módulo admin envia um POST para o serviço posts
  )
  @post_id = headers[:_id]
end

Dado(/^que o código do artigo é inválido ou incorreto$/) do
  @post_id = Faker::Lorem.characters(25)
end

Quando(/^o módulo admin envia um PUT para o serviço posts$/) do
  @req = {
    title: 'Choco, um jeito doce de Instalar coisas no Windows',
    image: 'http://qaninja.com.br/static/nblog/choco.png',
    body: get_details
  }
  put '/api/posts/' + @post_id.to_s, @req.to_json
end

Então(/^o JSON response deve conter os dados atualizados do artigo$/) do
  get '/api/posts/' + @post_id.to_s
  expect(json_body).to include(title: @req[:title], body: @req[:body])
end

# GET

Quando(/^o módulo admin envia um GET para o serviço posts$/) do
  get '/api/posts'
end

Então(/^o JSON response deve conter uma lista de artigos publicados$/) do
  expect_json_types('*', title: :string, body: :string)
  expect(json_body).not_to be_empty
end

# Delete

Quando(/^o módulo admin envia um DELETE para o serviço posts$/) do
  delete '/api/posts/' + @post_id.to_s
end
