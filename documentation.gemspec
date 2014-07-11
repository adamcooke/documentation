$:.push File.expand_path("../lib", __FILE__)

require "documentation/version"

Gem::Specification.new do |s|
  s.name        = "documentation"
  s.version     = Documentation::VERSION
  s.authors     = ["Adam Cooke"]
  s.email       = ["adam@atechmedia.com"]
  s.homepage    = "http://adamcooke.io"
  s.licenses    = ['MIT']
  s.summary     = "A Rails engine to provider the ability to add documentation to a Rails application"
  s.description = "It does cool stuff!"
  s.files = Dir["{lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
end
