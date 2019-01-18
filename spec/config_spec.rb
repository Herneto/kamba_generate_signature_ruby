

describe 'KambaSignatureGeneration' do
  describe 'secret_key' do
    before(:each) do
      @default_secret_key = KambaSignatureGeneration.secret_key
      KambaSignatureGeneration.secret_key = nil
      ENV['KAMBA_SECRET_KEY'] = nil
    end

    after(:each) do
      KambaSignatureGeneration.secret_key = @default_secret_key
    end

    it 'should set and read instance variable' do
      KambaSignatureGeneration.secret_key = '123'
      KambaSignatureGeneration.secret_key.should == '123'
    end

    it 'should fallback to ENV variable' do
      ENV['KAMBA_SECRET_KEY'] = 'checkout'
      KambaSignatureGeneration.secret_key.should == 'checkout'
    end
  end
end
