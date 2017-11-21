$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_enum_type/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name = "rails_enum_type"
  s.version = RailsEnumType::VERSION
  s.authors = ["davidabenson"]
  s.email = ["david_a_benson@yahoo.com"]
  s.homepage = "https://github.com/davidabenson/rails_enum_type"
  s.summary = "Enum list backed by a database"
  s.description = "Enum list backed by a database"
  s.license = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.7"

  s.add_development_dependency "sqlite3"
end
