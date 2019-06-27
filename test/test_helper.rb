require 'dotenv'
Dotenv.load

require 'simplecov'
require 'pry'
require 'coveralls'
Coveralls.wear!

SimpleCov.formatters = [
  Coveralls::SimpleCov::Formatter,
  SimpleCov::Formatter::HTMLFormatter,
]

SimpleCov.start do
  skip_token 'skip_test_coverage'
end

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "lime_survey"

require "minitest/autorun"
require 'vcr'

VCR.configure do |c|
  c.default_cassette_options = { record: ENV["RECORD"] ? ENV["RECORD"].to_sym : :new_episodes, match_requests_on: [:query], erb: true }
  c.cassette_library_dir = "test/vcr/cassettes"
  c.hook_into :webmock
  c.filter_sensitive_data('<LIMESURVEY_API_URL>' ) { ENV["LIMESURVEY_API_URL"]  }
  c.filter_sensitive_data('<LIMESURVEY_USERNAME>') { ENV["LIMESURVEY_USERNAME"] }
  c.filter_sensitive_data('<LIMESURVEY_PASSWORD>') { ENV["LIMESURVEY_PASSWORD"] }
  c.filter_sensitive_data('<LIMESURVEY_BASE_URL>') { ENV["LIMESURVEY_BASE_URL"] }
end

