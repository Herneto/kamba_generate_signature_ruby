require "kamba_signature_generation/version"

module KambaSignatureGeneration
  class Error < StandardError; end

  require 'time'
  require 'json'
  require 'digest'
  require 'openssl'
  require 'base64'

  require 'kamba_signature_generation/api'
  require 'kamba_signature_generation/config'
end
