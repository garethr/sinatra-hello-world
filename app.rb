#!/usr/bin/env ruby

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