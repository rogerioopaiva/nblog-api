ENV['RACK_ENV'] = 'development'

require '../app' # <-- your sinatra app
require 'rspec'
require 'rack/test'

describe 'The Ninja Books Api' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'home app' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('Welcome to Ninja Books API')
  end

  it 'save new usuer' do
    h = { 'Content-Type' => 'application/json' }
    body = {
      name: 'Fernando Papito',
      email: 'eu@papito.idssdosso',
      password: '1234567'
    }.to_json
    post 'api/user', body, h
    expect(last_response).to be_ok
  end
end
