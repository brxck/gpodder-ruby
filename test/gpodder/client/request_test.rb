require "test_helper"

class RequestATest < Minitest::Test
  def setup
    VCR.use_cassette("client_config") do
      @client = GPodder::Client.new
    end
  end

  def test_it_makes_get_requests
    VCR.use_cassette("toplist") do
      response = @client.toplist(3)
      assert_kind_of GPodder::Collection, response
    end
  end

  def test_it_returns_resources
    VCR.use_cassette("podcast_data") do
      response = @client.podcast("http://adventurezone.libsyn.com/rss#_=_")
      assert_kind_of GPodder::Resource, response
      assert_equal "The Adventure Zone", response.title
    end
  end
end
