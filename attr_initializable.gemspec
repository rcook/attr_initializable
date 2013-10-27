$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "attr_initializable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "attr_initializable"
  s.version     = AttrInitializable::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of AttrInitializable."
  s.description = "TODO: Description of AttrInitializable."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.14"

  s.add_development_dependency "sqlite3"
end
