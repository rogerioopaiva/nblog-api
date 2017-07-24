# app.rb
require 'sinatra'
require 'sinatra/namespace'
require 'sinatra/reloader' if development?

require_relative 'endpoints/posts'

# Rota padrão
get '/' do
  @env = ENV['RACK_ENV'].to_s.upper
  "Welcome to nBlog API. Environment: #{@env}."
end