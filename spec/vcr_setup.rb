require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "spec/cassettes"
  config.hook_into :webmock
  config.default_cassette_options = {:serialize_with => :json}
  config.before_record do |r|
    r.request.headers.delete("Authorization")
  end
end

