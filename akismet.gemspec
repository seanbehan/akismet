# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'akismet/version'

Gem::Specification.new do |s|
  s.name        = 'akismet'
  s.version     = Akismet::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = [ 'Jonah Burke' ]
  s.email       = [ 'jonah@bigthink.com' ]
  s.homepage    = ''
  s.summary     = 'A Ruby client for the Akismet API'
  s.description = s.summary

  s.required_ruby_version = '~> 1.8.6'
  s.required_rubygems_version = '>= 1.3.5'

  s.files        = Dir.glob( 'lib/**/*' )
  s.require_path = 'lib'
end