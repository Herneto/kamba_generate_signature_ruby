# frozen_string_literal: true

describe 'KambaSignatureGeneration' do
  describe 'secret_key' do
    it 'should have a secret_key' do
      secret_key = KambaSignatureGeneration.secret_key = 'secret_key'
      expect(secret_key).to_not be_nil
    end

    # TODO: What about when the secret_key is nil.
    #       What errors/exceptions are returned?
  end
end
