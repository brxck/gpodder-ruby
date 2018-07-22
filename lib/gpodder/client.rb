require "faraday"
require "json"

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
      @connect = Faraday.new(url: @baseurl)
    end
  end
end
