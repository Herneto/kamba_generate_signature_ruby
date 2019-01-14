# Gerando Assinaturas para o Checkout

Com Ruby:

Basta configurar o a hash checkout conforme desejado e definir a variável de ambiente SECRET_KEY com a sua chave secreta:

```ruby
require 'time'
require 'json'
require 'digest'
require 'openssl'
require "base64"

time = Time.now.httpdate

secret_key = ENV['SECRET_KEY'].to_s

checkout = {
  "channel"=>"WEB",
  "initial_amount"=>5500,
  "notes"=> "Alguma note exemplo.",
  "redirect_url_success"=>"http://amarildolucas.com/curso/aplicativo-movel-com-swift/sucesso"
};

def generate_md5(checkout)
  Digest::MD5.base64digest(checkout)
end

json_string = checkout.to_json
canonical_string =  "POST,application/json,#{generate_md5(json_string)},#{"/v1/checkouts"},#{time}"
digest = OpenSSL::Digest.new('sha1')

hmac_signature = OpenSSL::HMAC.digest(digest, secret_key, canonical_string)
signature = Base64.strict_encode64(hmac_signature)
```

Com Ruby on Rails:

```ruby
time = Time.now.httpdate

secret_key = ENV['SECRET_KEY'].to_s

checkout = {
  "channel"=>"WEB",
  "initial_amount"=>5500,
  "notes"=> "Alguma note exemplo.",
  "redirect_url_success"=>"http://amarildolucas.com/curso/aplicativo-movel-com-swift/sucesso"
};

def generate_md5(checkout)
  Digest::MD5.base64digest(checkout)
end

json_string = checkout.to_json
canonical_string =  "POST,application/json,#{generate_md5(json_string)},#{"/v1/checkouts"},#{time}"
digest = OpenSSL::Digest.new('sha1')

hmac_signature = OpenSSL::HMAC.digest(digest, secret_key, canonical_string)
signature = Base64.strict_encode64(hmac_signature)
```

Finalmennte, use o valor das variáveis `time` e `signature` para configurar o header do checkout nos parâmetros com o mesmos nomes das variáveis.
