require 'rubygems'
require 'sinatra'
require 'json'
require 'pony'

configure :production do
  require 'newrelic_rpm'
end

post '/' do
  data = JSON.parse(request.body.read, symbolize_names: true)
  Pony.mail(to: data[:to],
            from: 'noreply@example.com',
            subject: data[:subject],
            body: data[:body],
            :via => :smtp,
            via_options: {
              address: 'smtp.sendgrid.net',
              port: '587',
              domain: 'heroku.com',
              user_name: ENV['SENDGRID_USERNAME'],
              password: ENV['SENDGRID_PASSWORD'],
              :authentication => :plain,
              enable_starttls_auto: true
            })
end