
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "kamba_signature_generation/version"

Gem::Specification.new do |spec|
  spec.name          = "kamba_signature_generation"
  spec.version       = KambaSignatureGeneration::VERSION
  spec.authors       = ["Hernani Neto"]
  spec.email         = ["hernaniprogramacao@gmail.com"]


  spec.summary       = %q{Kamba Signature Generation}
  spec.description   = %q{A gem to generate signatures based on your Kamba secret key to use with Kamba Checkout Js.}
  spec.homepage      = "https://github.com/usekamba/generate-signature-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split("\n")
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
