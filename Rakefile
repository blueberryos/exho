# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = "exho"
  gem.homepage = "http://github.com/vertexclique/exho"
  gem.license = "MIT"
  gem.summary = %Q{TODO: Driver managing framework for raspberry pi}
  gem.description = %Q{TODO: longer description of your gem}
  gem.email = "mahmutbulut0@gmail.com"
  gem.authors = ["Mahmut Bulut"]
  # dependencies defined in Gemfile
  gem.executables = ['exho']
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

require 'rcov/rcovtask'
Rcov::RcovTask.new do |test|
  test.libs << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
  test.rcov_opts << '--exclude "gems/*"'
end

#require 'cucumber/rake/task'
#Cucumber::Rake::Task.new(:features)

task :default => :test

require 'yard'
YARD::Rake::YardocTask.new
