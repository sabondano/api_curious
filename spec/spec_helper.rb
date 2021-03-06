require 'simplecov'
require 'vcr_setup'
require 'webmock'
require 'helpers'
SimpleCov.start

RSpec.configure do |config|
  include Helpers

  config.backtrace_exclusion_patterns << %r{/gems/}

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

 # reset OmniAuth to a consistent state
  config.before(:each) do
    OmniAuth.config.mock_auth[:twitter] = nil
  end


  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
