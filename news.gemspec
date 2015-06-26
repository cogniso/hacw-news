$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "news/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "news"
  s.version     = News::VERSION
  s.authors     = ["AlexMuir"]
  s.email       = ["me@alexmuir.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of News."
  s.description = "TODO: Description of News."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "sass-rails"
  s.add_dependency "rails", "~> 4.2.1"
  s.add_dependency "faker"

  s.add_development_dependency "sqlite3"
end
