$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "smsway_api/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "smsway_api"
  s.version     = SmswayApi::VERSION
  s.authors     = ["Alexandr Subbotin"]
  s.email       = ["kelionweb@gmail.com"]
  s.homepage    = "https://github.com/KELiON/smsway_api"
  s.summary     = "Ruby wrapper for smsway.ru xml API"
  s.description = "Simple ruby wrapper for smsway.ru XML API. Provides simples methods for sending sms, flash sms, vcard and wappushes, check balance."

  s.license     = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 1.9.2'

  s.add_runtime_dependency 'builder', '~> 3.2'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '~> 2.14'

end
