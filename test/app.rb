require 'rubygems'
require 'sinatra'
require 'sinatra/test/unit'

require 'app'

class MyAppTest < Test::Unit::TestCase

  def test_root
    get_it '/'
    assert_equal 200, @response.status
    assert_equal 'Hello world', @response.body
  end

  def test_gone
    get_it '/gone'
    assert_equal 410, @response.status
    assert_equal 'Gone', @response.body
  end

  def test_gone
    get_it '/gone'
    assert_equal 410, @response.status
    assert_equal 'Gone', @response.body
  end

  def test_force
    get_it '/force'
    assert_equal 301, @response.status
    assert_equal '/', @response.location  
    follow!
    assert_equal 200, @response.status
    assert_equal 'Hello world', @response.body  
  end
  
  def test_redirect
    get_it '/home'
    assert_equal 302, @response.status
    assert_equal '/', @response.location
    follow!
    assert_equal 200, @response.status
    assert_equal 'Hello world', @response.body
  end

  def test_404
    get_it '/404'
    assert_equal 404, @response.status
    assert_equal 'This is nowhere to be found', @response.body
  end

  def test_splat
    get_it '/splat/1/2'
    assert_equal 200, @response.status
    assert_equal '12', @response.body
  end

  def test_param
    get_it '/param/param'
    assert_equal 200, @response.status
    assert_equal 'parambar', @response.body
  end

end