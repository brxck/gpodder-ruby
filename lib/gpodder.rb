require_relative "gpodder/client"
require_relative "gpodder/resource"
require_relative "gpodder/collection"
require_relative "gpodder/version"

require "faraday"

module GPodder
end

# A global instance of GPodder::Client
GPod = GPodder::Client.new
