#!/usr/bin/env ruby

# TODO: test coverage 
# TODO: pylint equivalent
# TODO: comments
# TODO: RDoc task
# TODO: views tests with templates
# TODO: update REAME
# TODO: Rake task to clean up logs dir
# TODO: gem spec
# TODO: capistrano recipe
# TODO: Rspec tests

require 'rubygems'
require 'sinatra'

set :public, "public"

get '/' do
  'Hello world'
end

get '/index' do
  erb :index
end

not_found do
  'This is nowhere to be found'
end

error do
  'Sorry there was a nasty error - ' + request.env['sinatra.error']
end