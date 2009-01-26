#!/usr/bin/env ruby

# TODO: comments in source
# TODO: views tests with templates
# TODO: Rake task to clean up logs dir
# TODO: gem spec
# TODO: capistrano recipe
# TODO: Rspec tests
# TODO: database interaction

require 'rubygems'
require 'sinatra'

require 'helpers'

set :public, "public"

configure do
  Sample = "test"
  Version = Sinatra::VERSION
end

before do
  @title = "before"
  @version = Version
end

get '/' do
  'Hello world'
end

get '/index' do
  header 'Content-Type' => 'text/html; charset=utf-8'
  @page_title = "Title"
  @string = Sample
  erb :index
end

get '/param/:name' do
  bar(params[:name])
end

get '/splat/*/*' do
  params["splat"][0] + params["splat"][1]
end

get '/home' do
  redirect '/'
end

get '/force' do
  redirect '/', 301
end

get '/gone' do
  status 410
  "Gone"
end

not_found do
  'This is nowhere to be found'
end

error do
  'Sorry there was a nasty error - ' + request.env['sinatra.error']
end