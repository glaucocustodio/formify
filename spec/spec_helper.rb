require 'awesome_print'
require 'pry'
require 'rails'

# $LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
# require 'formify'

if defined? Rails
  require 'fake_app/rails_app'
end

RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
end
