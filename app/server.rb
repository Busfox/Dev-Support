require 'sinatra'
require 'dotenv'
require 'httparty'
require 'pry'

class Server < Sinatra::Base

  set :protection, :except => :frame_options
  enable :sessions

  Dotenv.load
  API_KEY = ENV['API_KEY']
  API_SECRET = ENV['API_SECRET']
  TOKEN = ENV['TOKEN']
  APP_URL = 'polaris-test1.ngrok.io'
  @@shops = {}
  
  get '/' do
    erb :index, :locals => { :key => API_KEY }
  end
  
  get '/install' do
    shop = request.params['shop']
    if @@shops[shop]
      scopes = "read_orders,read_products"
      install_url =
        "https://#{shop}/admin/oauth/authorize?client_id=#{API_KEY}"\
        "&scope=#{scopes}&redirect_uri=https://#{APP_URL}/auth/shopify/callback"
      redirect install_url
    else
      redirect '/'
    end
  end
  
  get '/auth/shopify/callback' do
    shop = request.params['shop']
    code = request.params['code']
    url = "https://#{shop}/admin/oauth/access_token"
    payload = { client_id: API_KEY, client_secret: API_SECRET, code: code }
    response = HTTParty.post(url, body: payload)
    @@shops[shop] = response['access_token']
    redirect '/'
  end
  
  get '/bundle.js' do
    send_file File.join(settings.public_folder, 'bundle.js')
  end
  
end
