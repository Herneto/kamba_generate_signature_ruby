require 'spec_helper'

describe 'KambaSignatureGeneration::API' do
  describe 'Generating Signature' do
    before(:each) do
      @checkout = {
        channel: 'WEB',
        initial_amount: 5500,
        notes: 'Alguma note exemplo.',
        redirect_url_success: 'http://amarildolucas.com/curso/aplicativo-movel-com-swift/sucesso'
      }
      KambaSignatureGeneration.secret_key = 'secret_key'
    end

    it 'should generate signature string' do
      signature = KambaSignatureGeneration::API.generate_signature(@checkout)
      expect(sinature).to_not be_nil
    end
  end
end
