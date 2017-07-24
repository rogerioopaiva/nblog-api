# app.rb
require 'sinatra'
require 'sinatra/namespace'
require 'sinatra/reloader' if development?

require_relative 'endpoints/posts'

# Rota padrão
get '/' do
  'Welcome to Ninja Books API'
end
