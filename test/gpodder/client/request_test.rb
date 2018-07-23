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

  def test_it_returns_resources
    VCR.use_cassette("podcast_data") do
      response = @client.get("/api/2/data/podcast.json"), "http://adventurezone.libsyn.com/rss#_=_"
      assert_kind_of GPodder::Client::Resource, response
      # assert_equal "The Adventure Zone", response.title
    end
  end
end
