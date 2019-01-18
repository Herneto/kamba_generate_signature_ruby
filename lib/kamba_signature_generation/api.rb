module KambaSignatureGeneration
  class API
    def self.generate_signature(checkout)
      secret_key = KambaSignatureGeneration.secret_key

      json_string = checkout.to_json
      canonical_string = "POST,application/json,#{generate_md5(json_string)},#{'/v1/checkouts'}"

      digest = OpenSSL::Digest.new('sha1')
      hmac_signature = OpenSSL::HMAC.digest(digest, secret_key, canonical_string)
      Base64.strict_encode64(hmac_signature)
    end

    def self.generate_md5(checkout)
      Digest::MD5.base64digest(checkout)
    end
  end
end
