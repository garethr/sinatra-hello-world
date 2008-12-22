require 'rubygems'
require 'sinatra'
require 'sinatra/test/unit'

require 'app'

class MyAppTest < Test::Unit::TestCase

  def test_root
    get_it '/'
    assert_equal 'Hello world', @response.body
  end

end