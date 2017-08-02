
module Helpers
  def create_articles
    articles = [
      {
        title: 'Como usar o Ubuntu Bash no Windows 10',
        image: 'http://qaninja.com.br/static/nblog/bash.png',
        body: Faker::Lorem.paragraph
      },
      {
        title: 'Instalando Ruby, Cucumber e Capybara no Windows 7, 8 e 10',
        image: 'http://qaninja.com.br/static/nblog/ruby_windows.png',
        body: Faker::Lorem.paragraph
      },
      {
        title: 'A Qualidade e o conflito de gerações',
        image: 'http://qaninja.com.br/static/nblog/war.png',
        body: Faker::Lorem.paragraph
      },
      {
        title: 'Você sabe quanto custam suas reuniões?',
        image: 'http://qaninja.com.br/static/nblog/meeting.png',
        body: Faker::Lorem.paragraph
      },
      {
        title: 'Fim de uma éra dos testes? Acabou?',
        image: 'http://qaninja.com.br/static/nblog/age.png',
        body: Faker::Lorem.paragraph
      }
    ]

    articles.each do |a|
      post '/api/posts', a.to_json
    end
  end
end
