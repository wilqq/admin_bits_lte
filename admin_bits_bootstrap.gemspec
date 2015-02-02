# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'admin_bits_bootstrap/version'

Gem::Specification.new do |spec|
  spec.name          = "admin_bits_bootstrap"
  spec.version       = AdminBitsBootstrap::VERSION
  spec.authors       = ["Mateusz Wilczynski"]
  spec.email         = ["majko7@interia.pl"]
  spec.summary       = "AdminBitsBootstrap is addition to the AdminBitst"
  spec.homepage      = ""

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
