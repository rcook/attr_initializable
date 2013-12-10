require 'coveralls'
Coveralls.wear!

require File.expand_path('../test_utils', __FILE__)
require 'attr_initializable'

puts "Active Record #{TestUtils.active_record_version} is loaded"
require 'minitest/autorun'

