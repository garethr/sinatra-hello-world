# this rackup file is used to run the application
# when run via the Thin rack interace 

require 'rubygems'
require 'sinatra'

# we need to manually specify where our views live
views_path = File.join(File.dirname(__FILE__), 'views') 
Sinatra::Application.default_options.merge!( 
  :views => views_path, 
  :run => false, 
  :env => :production 
) 

# then load and run the application
load 'app.rb'
run Sinatra.application