# Kamba Signature Generation

Gem ruby para gerar a assinatura necessária para processar o checkout nos serviços da Kamba.
## Instalação

Adicione essa linha ao Gemfile da sua applicação:

```ruby
gem 'kamba_signature_generation'
```

E execute:

    $ bundle

ou instale por você mesmo:

    $ gem install kamba_signature_generation

## Configuração

```ruby
require 'kamba_signature_generation'

KambaSignatureGeneration.secret_key = 'sua-chave-secreta-kamba'
```

Ou simplesmente atribua o valor da sua chaves-chave-kamba secreta a seguinte variável de ambiente: `ENV["KAMBA_SECRET_KEY"]`.

Usando Ruby on Rails? Coloque isso em config/initializers em novo arquivo chamado kamba_signature_generation.rb.

## Uso

```ruby
checkout_config = {
            "channel"=>"WEB",
            "initial_amount"=>10000,
            "notes"=> "Curso API Iniciantes",
            "redirect_url_success"=>"https://seusite.com/curso/api-iniciantes"
      }
@signature = KambaSignatureGeneration::API.generate_signature(checkout_config)
```
Obs: `KAMBA-API-MODE: sandbox, staging ou production`


**Configurações `checkout_config`:**
- Para o nosso propósito o valor do campo `channel`, permanecerá igual à **WEB** como no exemplo.
- `initial_amount`, este campo recebe o preço do produto ou serviço a ser comercializado.
- Substitua o valor do campo `notes` por uma anotação ou descrição geral a cerca do pagamento, e coloque o preço do mesmo no valor do campo `initial_amount`.
- O campo `redirect_url_success` recebe o endereço da página na qual pretende-se ser redirecionada após o pagamento com sucesso.

Finalmente, use o valor de `@signature` para assinar processar o checkout.
