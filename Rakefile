require 'rake'
require 'rake/testtask'

task "default" => ["test"]

Rake::TestTask.new('test') do |t|
  t.pattern = 'test/**/*.rb'
  t.warning = false
end