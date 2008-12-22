require 'rubygems'
require 'spec'
require 'sinatra'
require 'sinatra/test/rspec'

require 'app'

describe 'My app' do
  it 'should show a default page' do
    get_it '/'
    @response.should be_ok
    @response.body.should == 'Hello world'
  end
end