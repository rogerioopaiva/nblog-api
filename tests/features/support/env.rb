# env.rb
require 'airborne'
require 'faker'

require_relative '../../../app'
require_relative 'helpers'

World(Helpers)

include Airborne

Airborne.configure do |config|
  config.base_url = 'http://nblog-api-qa.herokuapp.com'
end
