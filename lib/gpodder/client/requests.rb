module GPodder
  class Client
    def get(path, options = {})
      request(:get, path, options)
    end

    def post(path, options = {})
      request(:post, path, options)
    end

    def put(path, options = {})
      request(:put, path, options)
    end

    private

    def request(method, path, options)
      response = connect.send(method, path, options)
      response.body
    end

    def parse_body(body)

    end
  end
end
