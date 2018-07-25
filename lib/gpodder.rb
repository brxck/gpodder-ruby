require "gpodder/client"
require "gpodder/resource"
require "gpodder/collection"
require "gpodder/version"

require "faraday"

module Gpodder
end

# A global instance of Gpodder::Client
Gpod = Gpodder::Client.new
