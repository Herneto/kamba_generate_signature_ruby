module KambaSignatureGeneration
  class << self
    def secret_key=(key)
      @secret_key= key
    end

    def secret_key
      @secret_key || ENV["KAMBA_SECRET_KEY"]
    end
  end
end
