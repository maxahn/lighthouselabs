# Helper file to setup our tests/specs for this program.
# NO NEED TO EDIT

require 'pry'
require 'rspec'

def safely_require(file)
  require_relative file
rescue LoadError
  # ignore
end

safely_require 'unit'
safely_require 'footman'
safely_require 'barracks'
safely_require 'seige_engine'

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
end
