require 'sinatra'
require 'dotenv'

API_KEY = ENV['API_KEY']
API_SECRET = ENV['API_SECRET']

get '/' do
  send_file File.expand_path('index.html', settings.public_folder)
end
