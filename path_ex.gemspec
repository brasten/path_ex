# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'path_ex/version'

Gem::Specification.new do |spec|
  spec.name          = "path_ex"
  spec.version       = PathEx::VERSION
  spec.authors       = ["Brasten Sager"]
  spec.email         = ["brasten@brasten.me"]
  spec.summary       = "Provides dot-notation-based key access to nested hash values"
  spec.description   = ""
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", ">= 3.2"
  spec.add_development_dependency "guard-rspec", "~> 4.5"

end
