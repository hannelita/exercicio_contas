Instruções de uso
* A contextualização do problema se encontra no arquivo desafo.pdf

* Para rodar o programa, basta executar o script calcula_balanco.rb, passando dois argumentos:
a. o arquivo de contas (formato csv)
b. o arquivo de transações

* Se, assim como eu, você também está com preguiça de criar um com as próprias mãos, use o script gerador_arquivos.rb. Ele gerará os dois arquivos que você precisa: contas_geradas.csv e transacoes_geradas.csv. 

* Exemplo para executar o arquivo utilizando o script gerador de CSVs:
ruby calcula_balanco.rb contas_geradas.csv transacoes_geradas.csv

A saída irá para o arquivo
balanco_gerado.csv

(Caso esteja com preguiça de gerar na mão ou rodar o script, use o conteúdo da pasta arquivos_base)

Considerações
a. Usar o RSpec para uma situação simples como essa seria um pouco exagerado. O TestUnit é ruinzinho mas dá conta do recado nos cenários mais simples!
Como faz bem manter as coisas simples, vamos utilizá-lo!

b. Problema resolvido em 2 horas e 07 minutos. Não é lá a melhor solução do universo, mas possui alguns testes e princípios básicos de OO.

c. Os principais pontos de erro foram cobertos.

d. Tunning de CSV não foi considerado aqui! Até pensei nisso, mas assumi que um arquivo com 30 mil linhas não seria passado como input. Se passar, vai ficar lento! O programa não contém nenhum mecanismo de buffer ou nenhuma otimização de memória/performance avançada.

