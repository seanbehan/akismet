require 'rake/testtask'

task :default => :test

Rake::TestTask.new do |t|
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Build gem'
task :build do
  system 'gem build akismet.gemspec'
end