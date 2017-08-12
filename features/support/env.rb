require 'airborne'
require 'faker'

$env = ENV['RACK_ENV']

if $env.eql?('qa')
    @base_url = 'https://nblog-api-qa.herokuapp.com'
elsif $env.eql?('uat')
    @base_url = 'https://nblog-api-uat.herokuapp.com'
elsif $env.eql?('production')
    @base_url = 'https://nblog-api.herokuapp.com'
end

include Airborne

Airborne.configure do |config|
    config.base_url = @base_url
end

