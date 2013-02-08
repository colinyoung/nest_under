# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nest_under/version'

Gem::Specification.new do |gem|
  gem.name          = "nest_under"
  gem.version       = NestUnder::VERSION
  gem.authors       = ["Colin Young"]
  gem.email         = ["me@colinyoung.com"]
  gem.description   = %q{Lets you mark a resource as nested in your tests to avoid re-listing its parent}
  gem.summary       = %q{Easier nested resources in minitest controllers}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
