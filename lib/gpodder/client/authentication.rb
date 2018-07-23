module GPodder
  class Client
    # Checks if login is valid, replaces connection object
    def login(username, password)
      auth_connect = Faraday.new(url: @baseurl) do |conn|
        conn.request  :url_encoded
        conn.response :json, content_type: /\bjson$/
        conn.adapter  Faraday.default_adapter
        conn.basic_auth(username, password)
      end

      return false unless auth_connect.post("/api/2/auth/#{username}/login.json")
                                      .success?

      @connect = auth_connect
      @username = username
    end

    # Logs out and replaces connection object
    def logout
      post("/api/2/auth/#{@username}/logout.json")

      @connect = Faraday.new(url: @baseurl) do |conn|
        conn.request  :url_encoded
        conn.response :json, content_type: /\bjson$/
        conn.adapter  Faraday.default_adapter
      end

      @username = nil
    end
  end
end
