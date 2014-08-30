#!/usr/bin/env rake
require 'rake'

desc 'Run Ruby style checks with Rubocop'
task :rubocop do
  sh 'bundle exec rubocop'
end

desc 'Run Chef style checks with Foodcritic'
task :foodcritic do
  sh 'bundle exec foodcritic .'
end

desc 'Run ChefSpec unit tests'
task :chefspec do
  sh 'rspec spec/** --color'
end

task :test => [:foodcritic]
