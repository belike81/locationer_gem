$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "locationer/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "locationer"
  s.version     = Locationer::VERSION
  s.authors     = ["Tomasz Grabowski"]
  s.email       = ["belike81@gmail.com"]
  s.homepage    = "http://www.tomaszgrabowski.com"
  s.summary     = "Library to provide an API for giving nearby cities in US based on the given city."
  s.description = "Locationer is an mountable API that provides functionality of providing results of cities nearby a given city based on the provided range."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "<= 4.0.0"
  s.add_dependency "grape"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'factory_girl_rails'
end
