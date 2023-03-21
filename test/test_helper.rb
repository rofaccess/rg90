require "minitest/reporters"
Minitest::Reporters.use! unless ENV['RM_INFO']

ENV["RAILS_ENV"] ||= "test"

require_relative "../config/environment"
require "rails/test_help"

SimpleCov.formatter = SimpleCov::Formatter::MaterialFormatter
SimpleCov.start "rg90"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

# Según la documentación, debe estar al final o aunque sea despues de la línea require "rails/test_help"
require "mocha/minitest"
