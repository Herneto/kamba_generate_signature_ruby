# Kamba Signature Generation

Gem ruby para gerar a assinatura necessária para processar o checkout nos serviços da Kamba.

## Instalação

Adicione a linha abaixo ao Gemfile da sua aplicação:

```ruby
gem 'kamba_signature_generation'
```

E execute:

    $ bundle

ou instale através da linha de comandos:

    $ gem install kamba_signature_generation

## Configuração

```ruby
require 'kamba_signature_generation'

KambaSignatureGeneration.secret_key = 'SUA_CHAVE_SECRETA_KAMBA'
```

**Nota:** Use sempre configurações de variáveis de ambiente para manter os seus dados em segurança e nunca compartilhe a sua chave secreta ou adicione ao seu cliente frontend.
Exemplo: `ENV['SUA_CHAVE_SECRETA_KAMBA']`.

**Usando Ruby on Rails?**
Adicione o código acima em `config/initializers` em um arquivo chamado `kamba_signature_generation.rb`.

## Como gerar a assinatura

```ruby
checkout_config = {
  channel: 'WEB',
  initial_amount: 10000,
  notes: 'Curso API Iniciantes',
  redirect_url_success: 'https://seusite.com/curso/api-iniciantes'
}
@signature = KambaSignatureGeneration::API.generate_signature(checkout_config)
```

**Configurações `checkout_config`:**
- Para o nosso propósito o valor do campo `channel`, permanecerá igual à **WEB** como no exemplo.
- `initial_amount`, este campo recebe o preço do produto ou serviço a ser comercializado.
- Substitua o valor do campo `notes` por uma anotação ou descrição geral a cerca do pagamento, e coloque o preço do mesmo no valor do campo `initial_amount`.
- O campo `redirect_url_success` recebe o endereço da página na qual pretende-se ser redirecionada após o pagamento com sucesso.

Finalmente, use o valor de `@signature` para assinar processar o checkout no seu cliente frontend.
