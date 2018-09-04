VCR.configure do |c|
  c.configure_rspec_metadata!
  c.cassette_library_dir     = 'spec/cassettes'
  c.default_cassette_options = { record: :new_episodes }
  c.hook_into :webmock, :faraday
  c.ignore_localhost = true
  c.allow_http_connections_when_no_cassette = true
end
