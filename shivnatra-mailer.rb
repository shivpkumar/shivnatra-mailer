require 'rubygems'
require 'sinatra'
require 'json'
require 'pony'

post '/' do
  data = JSON.parse(request.body.read, symbolize_names: true)
  data[:from] = 'noreply@example.com'
  Pony.mail(data)
end