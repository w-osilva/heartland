# frozen_string_literal: true

require 'debug'
require 'simplecov'
require 'simplecov-console'
require 'factory_bot'

SimpleCov.minimum_coverage 100
SimpleCov.formatter = SimpleCov::Formatter::Console
SimpleCov.add_filter ['/spec/']
SimpleCov.start

# load libraries
Dir[File.join(__dir__, '../lib', '**', '*.rb')].each { |file| require file }

# load factories
FactoryBot.find_definitions

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.order = :random

  Kernel.srand config.seed
end
