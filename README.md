# DesafioStone

Leonardo Gonçalves da Silva

Função a ser chamada => DesafioStone.build() com aridade 2

Função espera duas listas, sendo a primeira formada por uma lista de Strings e a segundo uma lista de Maps.

Exemplo:

Lista de emails = ["email1@test.com","email2@test.com"]
Lista de Maps = [%{:item => "arroz", :price => 10000, :quantity => 3}, %{:item => "feijao", :price => 4000, :quantity => 4}]

As chaves dos Maps é um Atom cujo padrão a ser seguido é exatamente como consta no exemplo, e os valores devem seguir os mesmos tipos do exemplo: string, integer, integer.


Para compilar o projeto basta ir no diretorio do projeto, abrir o terminal e inserir o comando: mix compile
Depois de compilado basta inserir o seguinte comando para inciar o shell interativo do elixir: iex -S mix
Agora basta criar suas listas e maps e chamar a função build do módulo DesafioStone.

Para rodar os testes unitarios basta ir no terminar dentro do diretório do projeto e digitar: mix test
