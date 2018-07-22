$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require "gpodder"

require "minitest/autorun"
require "minitest/pride"
require "webmock/minitest"
require "vcr"

VCR.configure do |c|
  c.cassette_library_dir = "test/fixtures"
  c.hook_into :webmock
end
