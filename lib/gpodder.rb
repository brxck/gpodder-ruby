require_relative "gpodder/client"
require_relative "gpodder/resource"
require_relative "gpodder/collection"
require_relative "gpodder/version"

require "faraday"

module Gpodder
end

# A global instance of Gpodder::Client
Gpod = Gpodder::Client.new
