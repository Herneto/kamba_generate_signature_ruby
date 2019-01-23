# frozen_string_literal: true

require 'kamba_signature_generation/version'

# lib/kamba_signature_generation.rb
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
