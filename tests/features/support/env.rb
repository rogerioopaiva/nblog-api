# env.rb
require 'airborne'
require 'faker'

require_relative '../../../app'
require_relative 'helpers'

World(Helpers)

include Airborne

$env = ENV['RACK_ENV']

if $env.eql?('qa')
  @base_url = 'http://nblog-api-qa.herokuapp.com'
elsif $env.eql?('uat')
  @base_url = 'http://nblog-api-uat.herokuapp.com'
elsif $env.eql?('production')
  @base_url = 'http://nblog-api.herokuapp.com'
end

Airborne.configure do |config|
  config.base_url = @base_url
end
