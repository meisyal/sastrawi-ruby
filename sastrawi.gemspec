# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sastrawi/version'

Gem::Specification.new do |spec|
  spec.name          = "sastrawi"
  spec.version       = Sastrawi::VERSION
  spec.required_ruby_version = ">= 2.3.8"
  spec.authors       = ["Andrias Meisyal"]
  spec.email         = ["andriasonline@gmail.com"]

  spec.summary       = %q{Ruby bindings for Sastrawi}
  spec.description   = %q{A Ruby library which allows you to stem words in Bahasa Indonesia.}
  spec.homepage      = "https://github.com/meisyal/sastrawi-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.2.14"
  spec.add_development_dependency "rake", "~> 13.0.1"
  spec.add_development_dependency "rspec", "~> 3.10.0"
end
