class Auth < Server

  def verify_request
		hmac = params[:hmac]
		puts "hmac: #{hmac}"
		query = params.reject{|k,_| k == 'hmac'}
		message = Rack::Utils.build_query(query)
		digest = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), @secret, message)

		puts "digest: #{digest}"

		if not (hmac == digest)
			return [401, "Authorization failed!"]
		else
			puts "200 you good"
		end
	end

  get '/install' do
    @@shop = params[:shop]
    puts @@shop
    scopes = "read_products,write_products,read_orders,write_shipping"
    if @tokens[@@shop].nil?
      install_url = "https://#{@@shop}/admin/oauth/authorize?client_id=#{@key}&scope=#{scopes}&redirect_uri=https://#{@app_url}/auth"
      redirect install_url
    else
      verify_request
      redirect "https://#{@app_url}/auth"
    end
  end

  get '/auth' do
    code = params[:code]
    puts code
    verify_request

    if @tokens[@@shop].nil?
      response = HTTParty.post("https://#{@@shop}/admin/oauth/access_token",
        body: { client_id: @key, client_secret: @secret, code: code})

      puts response.code
      puts response

      if (response.code == 200)
        @tokens[@@shop] = response['access_token']
      else
        return [500, "No Bueno"]
      end
    end

    redirect '/'

  end

end
