# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

require 'documentation/version'

Gem::Specification.new do |s|
  s.name        = 'documentation'
  s.version     = Documentation::VERSION
  s.authors     = ['Adam Cooke']
  s.email       = ['adam@atechmedia.com']
  s.homepage    = 'http://adamcooke.io'
  s.licenses    = ['MIT']
  s.summary     = 'A Rails engine to provider the ability to add documentation to a Rails application'
  s.description = 'It does cool stuff!'

  s.files = Dir['{app,config,db,doc,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']

  s.add_dependency 'coffee-rails', '>= 5'
  s.add_dependency 'dynamic_form', '~> 1.1.4'
  s.add_dependency 'haml', '>= 4.0'
  s.add_dependency 'jquery-rails', '>= 3.0'
  s.add_dependency 'nifty-attachments', '>= 1.0.3'
  s.add_dependency 'nifty-dialog', '~> 1'
  s.add_dependency 'pygments.rb', '>= 0.5'
  s.add_dependency 'rails', '>= 6.0', '< 7.0'
  s.add_dependency 'redcarpet', '>= 3.1.0'
  s.add_dependency 'sass-rails', '>= 4.0'
  s.add_dependency 'uglifier', '>= 2.2'

  s.add_development_dependency 'sqlite3', '~> 1.3'
end
