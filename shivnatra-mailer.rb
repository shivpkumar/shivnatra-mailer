require 'sinatra'
require 'json'

post '/' do
  email_data = JSON.parse(request.body.read)
end