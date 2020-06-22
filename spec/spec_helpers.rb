require 'simplecov'

SimpleCov.start

require_relative '../rectangle'

RSpec.configure do |config|
  config.formatter = :documentation
end
