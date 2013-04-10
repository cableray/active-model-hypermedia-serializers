$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "hypermedia_serializers/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "hypermedia_serializers"
  s.version     = HypermediaSerializers::VERSION
  s.authors     = ["Cableray"]
  s.email       = ["cableraywire@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "ActiveModel Serializers for use in hypermedai apis."
  s.description = "TODO: Description of HypermediaSerializers."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.9"
  s.add_dependency "active_model_serializers", "~> 0.5.2"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "guard-spork"
  s.add_development_dependency "rspec-rails-mocha"
end
