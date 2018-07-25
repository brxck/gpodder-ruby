module Gpodder
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
      parse_data(response.body)
    end

    def parse_data(data)
      case data
      when Hash then Resource.new(data)
      when Array then Collection.new(data)
      else data
      end
    end
  end
end
