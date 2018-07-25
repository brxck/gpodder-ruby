require "test_helper"

class ClientTest < Minitest::Test
  def test_it_gets_base_url
    VCR.use_cassette("client_config") do
      client = Gpodder::Client.new
      assert_equal "http://gpodder.net/test", client.baseurl
    end
  end

  def test_it_has_fallback_url
    VCR.use_cassette("client_config_failed") do
      client = Gpodder::Client.new
      assert_equal "https://gpodder.net/", client.baseurl
    end
  end
end
