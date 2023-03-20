ENV["RAILS_ENV"] ||= "test"

require_relative "../config/environment"

# Obs.: Las siguientes 2 líneas no surten efecto si se ubican después de require "rails/test_help"
require "simplecov"
SimpleCov.start "rails"

require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
