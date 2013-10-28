# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'controller/version'

Gem::Specification.new do |spec|
  spec.name          = "controller"
  spec.version       = Controller::VERSION
  spec.authors       = ["Sudhir Jonathan"]
  spec.email         = ["sudhir.j@runway7.net"]
  spec.description   = %q{Control you AWS deployment from any command line}
  spec.summary       = %q{Control you AWS deployment from any command line}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
