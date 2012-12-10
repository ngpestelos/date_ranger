# -*- encoding: utf-8 -*-
require File.expand_path('../lib/date_ranger/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Nestor Pestelos and Ramon Tayag"]
  gem.email         = ["ngpestelos@gmail.com","ramon.tayag@gmail.com"]
  gem.description   = "Provides date range methods"
  gem.summary       = %q{Provides date range methods}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "date_ranger"
  gem.require_paths = ["lib"]
  gem.version       = DateRanger::VERSION

  gem.add_development_dependency "rspec", '~> 2.12.0'
  gem.add_runtime_dependency "active_support"
end

