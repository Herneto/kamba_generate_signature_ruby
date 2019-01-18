require 'spec_helper'

describe 'KambaSignatureGeneration::API' do
  describe 'Generating Signature' do
    before(:each) do
      @checkout = {
        'channel'=>'WEB',
        'initial_amount'=>5500,
        'notes'=> 'Alguma note exemplo.',
        'redirect_url_success'=> 'http://amarildolucas.com/curso/aplicativo-movel-com-swift/sucesso'
      }
      KambaSignatureGeneration.secret_key = '123'
    end

    it 'should generate signature' do
      signature = KambaSignatureGeneration::API.generate_signature(@checkout)
      signature.should_not == '123'
    end
  end
end
