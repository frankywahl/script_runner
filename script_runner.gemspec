$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "script_runner/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "script_runner"
  s.version     = ScriptRunner::VERSION
  s.authors     = ["Franky W."]
  s.email       = ["frankywahl@users.noreply.github.com"]
  s.homepage    = ""
  s.summary     = "Summary of ScriptRunner."
  s.description = "Description of ScriptRunner."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 5.0.0", "< 5.2"

  s.add_development_dependency "pg"
  s.add_development_dependency "pry"
  s.add_development_dependency "pry-byebug"
end
