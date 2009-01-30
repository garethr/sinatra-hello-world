#!/usr/bin/env ruby

# TODO: views tests with templates
# TODO: Rake task to clean up logs dir
# TODO: gem spec
# TODO: capistrano recipe
# TODO: Rspec tests
# TODO: database interaction

# require the basic gems needed
# for sinatra
require 'rubygems'
require 'sinatra'

# require some sample helpers
require 'helpers'

# require some sample middleware
require 'middleware'

use SampleRackMiddleware

# our static assets are stored in the public directory
set :public, "public"

# configure directives can be used to set constants
# that are available in each of your views
configure do
  Sample = "test"
  Version = Sinatra::VERSION
end

# before directives run before all the views
before do
  @title = "before"
  @version = Version
end

# simplest example view we first define a URL route and 
# then return some content to be displayed
get '/' do
  'Hello world'
end

# as well as just return body content we can also set
# the HTTP headers directly. This view also demonstrates the use
# of erb templates, with local variables being exposed to the template
get '/index' do
  header 'Content-Type' => 'text/html; charset=utf-8'
  @page_title = "Title"
  @string = Sample
  erb :index
end

# as well as fixed URLs we can also take named variables
# this view uses a sample helper from the previously loaded
# helpers file
get '/param/:name' do
  bar(params[:name])
end

# splats allow for unnamed wildcard variables in urls
get '/splat/*/*' do
  params["splat"][0] + params["splat"][1]
end

# the redirect method throws a 302 redirect
# and works with local or remote URLs or fragments
get '/home' do
  redirect '/'
end

# if we want to specify the status code for a redirect we can
get '/force' do
  redirect '/', 301
end

# By default views will be served with a 200 status code but 
# you can always overide this if needed
get '/gone' do
  status 410
  "Gone"
end

# sinatra provides a couple of useful defaul views for catching
# 404 not found errors
not_found do
  'This is nowhere to be found'
end

# the other useful default view is for catching 500 server errors
error do
  'Sorry there was a nasty error - ' + request.env['sinatra.error']
end