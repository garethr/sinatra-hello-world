require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rcov/rcovtask'

task "default" => ["test"]

Rake::TestTask.new('test') do |t|
  t.pattern = 'test/**/*.rb'
  t.warning = false
end

Rake::TestTask.new('spec') do |t|
  t.pattern = 'spec/**/*.rb'
  t.warning = false
end

Rake::RDocTask.new do |rd|
  rd.main = "README.textile"
  rd.rdoc_files.include("app.rb", "helpers.rb")
  rd.rdoc_dir = "docs"
  rd.options << "--inline-source"
  rd.options << "--all"
end

Rcov::RcovTask.new(:rcov) do |rcov|
  rcov.pattern    = 'test/*.rb'
  rcov.output_dir = 'rcov/test'
  rcov.verbose    = true
end

Rcov::RcovTask.new(:rcov_spec) do |rcov|
  rcov.pattern    = 'spec/*.rb'
  rcov.output_dir = 'rcov/spec'
  rcov.verbose    = true
end