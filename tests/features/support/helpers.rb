
module Helpers
  def get_details
    Faker::Lorem.paragraph(15)
  end

  def create_articles
    articles = [
      {
        title: 'A Qualidade e o conflito de gerações',
        image: 'http://qaninja.com.br/static/nblog/war.png',
        body: get_details
      },
      {
        title: 'Como usar o Ubuntu Bash no Windows 10',
        image: 'http://qaninja.com.br/static/nblog/bash.png',
        body: get_details
      },
      {
        title: 'Fim de uma éra dos testes? Acabou?',
        image: 'http://qaninja.com.br/static/nblog/age.png',
        body: get_details
      },
      {
        title: 'Instalando Ruby, Cucumber e Capybara no Windows 7, 8 e 10',
        image: 'http://qaninja.com.br/static/nblog/ruby_windows.png',
        body: get_details
      },
      {
        title: 'Você sabe quanto custam suas reuniões?',
        image: 'http://qaninja.com.br/static/nblog/meeting.png',
        body: get_details
      }
    ]

    articles.each do |a|
      post '/api/posts', a.to_json
    end
  end
end

