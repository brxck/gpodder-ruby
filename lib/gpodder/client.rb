require "faraday"
require "faraday_middleware"
require "json"

require_relative "client/requests"
require_relative "client/directory"
require_relative "client/authentication"

module GPodder
  # Makes requests against gpodder.net API.
  class Client
    attr_reader :connect
    attr_reader :baseurl
    # Creates Faraday connection object using API Client Parameterization
    def initialize
      response = Faraday.get "https://gpodder.net/clientconfig.json"
      @baseurl = JSON.parse(response.body).dig("mygpo", "baseurl") ||
                 "https://gpodder.net/"
      @connect = Faraday.new(url: @baseurl) do |conn|
        conn.request  :url_encoded
        conn.response :json, content_type: /\bjson$/
        conn.adapter  Faraday.default_adapter
      end
    end
  end
end
