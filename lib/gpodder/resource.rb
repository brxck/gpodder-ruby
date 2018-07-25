module Gpodder
  class Resource
    def initialize(hash)
      @data = OpenStruct.new(hash)
    end

    def method_missing(method_name, *arguments, &block)
      if @data.respond_to?(method_name)
        @data.send(method_name)
      else
        super
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      @data.respond_to?(method_name) || super
    end
  end
end
