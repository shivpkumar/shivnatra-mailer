require 'rubygems'
require 'sinatra'
require 'json'
require 'pony'

post '/' do
  data = JSON.parse(request.body.read, symbolize_names: true)
  data[:from] = 'noreply@example.com'
  puts "this is your data: #{data}"
  Pony.mail(data)
end

# { "to": "shivpkumar@gmail.com", "subject": "hello world", "body": "Hi John! Sending you an email via this awesome API I just made on the interwebs." }
