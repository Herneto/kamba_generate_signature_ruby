# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kamba_signature_generation/version'

Gem::Specification.new do |spec|
  spec.name          = 'kamba_signature_generation'
  spec.version       = KambaSignatureGeneration::VERSION
  spec.authors       = ['Hernani Neto', 'Amarildo Lucas']
  spec.email         = ['suporte@usekamba.com']
  spec.summary       = 'Kamba Signature Generation'
  spec.description   = 'A gem to generate signatures to use with Kamba Checkout Ruby/Rails integrations.'
  spec.homepage      = 'https://github.com/usekamba/kamba_generate_signature_ruby'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split("\n")
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
