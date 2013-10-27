lib = File.expand_path('../lib', __FILE__)
$:.unshift(lib) unless $:.include?(lib)

require 'attr_initializable/version'

Gem::Specification.new do |s|
  s.name = 'attr_initializable'
  s.version = AttrInitializable::VERSION
  s.date = Date.today rescue '1970-01-01'
  s.summary = 'attr_initializable'
  s.description = 'Rails plugin that provides attr_initializable helper to declare read-only attributes that can be mass-assigned at model creation time'
  s.license = 'MIT'
  s.authors = 'Richard Cook'
  s.email = 'rcook@rcook.org'
  s.files = Dir['{app,config,db,lib}/**/*'] + ['LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']
  s.require_paths = ['lib']
  s.homepage = 'https://github.com/rcook/attr_initializable/'
  s.add_dependency 'rails', '~> 3.2.14'
  s.add_development_dependency 'sqlite3'
end

