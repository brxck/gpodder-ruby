require "test_helper"

class RequestATest < Minitest::Test
  def setup
    VCR.use_cassette("client_config") do
      @client = GPodder::Client.new
    end
  end

  def test_it_makes_get_requests
    VCR.use_cassette("toplist") do
      response = @client.get("/toplist/1.json")
      assert_kind_of Array, response
    end
  end
end
