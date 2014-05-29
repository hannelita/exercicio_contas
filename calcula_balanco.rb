require './classes/processa_balanco'

begin
	raise 'Informe primeiramente o CSV de contas e depois o de transações' if ARGV.size != 2
	arquivo_contas = open(ARGV[0])
	arquivo_transacoes = open(ARGV[1])
	ProcessaBalanco.new(arquivo_contas, arquivo_transacoes)
rescue Exception => msg  
	puts "#{msg}"
end

