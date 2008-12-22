require 'rake'
require 'rake/testtask'

task "default" => ["test"]

Rake::TestTask.new('test') do |t|
  t.pattern = 'test/**/*.rb'
  t.warning = false
end

Rake::TestTask.new('spec') do |t|
  t.pattern = 'spec/**/*.rb'
  t.warning = false
end