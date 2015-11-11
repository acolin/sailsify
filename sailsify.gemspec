$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sailsify/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sailsify"
  s.version     = Sailsify::VERSION
  s.authors     = ["Arnoldo Rodriguez"]
  s.email       = ["rodriguezcolin@gmail.com"]
  s.homepage    = "https://www.github.com/acolin/sailsify"
  s.summary     = "Converts rails models and controllers to sails format"
  s.description = "Converts rails models and controllers to sails format"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.0"

  s.add_development_dependency "sqlite3"
end
