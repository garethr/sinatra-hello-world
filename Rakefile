require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rcov/rcovtask'

# set the default command to be running the unit tests
task "default" => ["test"]

# our tests are in the tests folder and this 
# command should run all ruby files found
Rake::TestTask.new('test') do |t|
  t.pattern = 'test/**/*.rb'
  t.warning = false
end

# we also have a number of spec tests which can be 
# run seperately
Rake::TestTask.new('spec') do |t|
  t.pattern = 'spec/**/*.rb'
  t.warning = false
end

# the rdoc task allows for generating documentation for the project
# in the docs directory
Rake::RDocTask.new do |rd|
  rd.main = "README.textile"
  rd.rdoc_files.include("app.rb", "helpers.rb", "middleware.rb")
  rd.rdoc_dir = "docs"
  rd.options << "--inline-source"
  rd.options << "--all"
end

# we're using rcov to get coverage reports for our tests
Rcov::RcovTask.new(:rcov) do |rcov|
  rcov.pattern    = 'test/*.rb'
  rcov.output_dir = 'rcov/test'
  rcov.verbose    = true
end

# we're also using rcov to get coverage reports for our specs
Rcov::RcovTask.new(:rcov_spec) do |rcov|
  rcov.pattern    = 'spec/*.rb'
  rcov.output_dir = 'rcov/spec'
  rcov.verbose    = true
end