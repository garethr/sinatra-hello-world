require 'application'

set :env,       :development
set :port,      4567
disable :run, :reload

run Sinatra.application