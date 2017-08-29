require 'sinatra'
require 'dotenv'
require 'httparty'
require 'pry'
require 'shopify_api'

class Server < Sinatra::Base

  set :protection, :except => :frame_options
  enable :sessions

  def initialize
		Dotenv.load
		@key = ENV['API_KEY']
		@secret = ENV['API_SECRET']
		@app_url = "drewbie.ngrok.io"
		@tokens = {}
		super
	end

	get '/' do
    erb :index, :locals => { :key => @key }
  end

  get '/product' do
    "Product API here"
  end

  get '/order' do
    "Order API here"
  end

end
