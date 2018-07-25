module Gpodder
  class Collection < Resource
    def initialize(array)
      @data = array.map { |hash| Resource.new(hash) }
    end
  end
end
