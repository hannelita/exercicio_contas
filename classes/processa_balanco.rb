require_relative './conta'
require_relative './transacao'

class ProcessaBalanco
	attr_accessor :arquivo_contas, :arquivo_transacoes, :contas
	def initialize(arquivo_contas, arquivo_transacoes)
		raise "Favor passar somente arquivos CSV" if (File.extname(arquivo_contas) != ".csv" || File.extname(arquivo_transacoes) != ".csv")
		@arquivo_contas = arquivo_contas
		@arquivo_transacoes = arquivo_transacoes
		cria_hash_contas_transacoes(processa_arquivo_contas, processa_transacoes)
		efetua_balanco
		#ler csv
		#montar um hash conta:[valor]
		#aplicar regras
	end

	def processa_arquivo_contas
		begin
			contas_com_saldo = ajusta_contas(formata(IO.readlines(@arquivo_contas)))
		rescue Exception => msg  
			puts "#{msg}"
		end
		contas_com_saldo
	end

	def processa_transacoes
		begin
			transacoes_com_valor = (formata(IO.readlines(@arquivo_transacoes)))
			transacoes_array = ajusta_transacoes(transacoes_com_valor)
		rescue Exception => msg  
			puts "#{msg}"
		end
		transacoes_array
	end

	def cria_hash_contas_transacoes(hash_contas, array_transacoes)
		array_transacoes.each do |t|
			hash_contas[t[0]] << t[1]
		end
		@contas = cria_contas(hash_contas)
	end

	def efetua_balanco
		output = ""
		@contas.each do |c|
			c.aplica_transacoes
			output << c.numero.to_s << "," << c.saldo.to_s << "\n"
		end

		file = File.new("balanco_gerado.csv", "w")
		File.open("balanco_gerado.csv", 'w') { |file| file.write(output) }

	end

	def formata(contas_com_valor)
		contas = []
		raise "Arquivo não pode estar vazio" if contas_com_valor.empty?
		contas_com_valor.each do |cv|
			cv.delete!("\n")
			contas << cv.split(",")
		end
		contas
	end

	def ajusta_contas (contas_com_saldo)
		contas_com_saldo.flatten!.map! { |x| Integer(x) }
		contas_hash = Hash[*contas_com_saldo]
		contas_hash.each do |k,v|
			values = []
			contas_hash[k] = values << v
		end
		contas_hash
	end

	def ajusta_transacoes(transacoes_com_valor)
		transacoes_com_valor.each do |t|
			t.map! { |x| Integer(x) }
		end
		transacoes_com_valor
	end

	def cria_contas(contas_com_saldo)
		@contas = []
		contas_com_saldo.each do |k,v|
			c = Conta.new(k,v)
			@contas << c
		end
		@contas
	end
end