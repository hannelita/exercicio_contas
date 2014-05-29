#!/usr/bin/env ruby

def gera_conta_e_saldo
		output = ""
		r = Random.new
		(1..5).each do |i|
			output << i.to_s << ","
			saldo = r.rand(-20..20)
			output << (saldo*100).to_s
			output <<  "\n"
		end		
		output
end
def gera_conta_e_transacoes
		output = ""
		r = Random.new
		(0..10).each do |i|
			conta = r.rand(1..5)
			output << conta.to_s << ","
			transacao = r.rand(-20..20)
			output << (transacao*100).to_s
			output <<  "\n"
		end		
		output
end


file = File.new("contas_geradas.csv", "w")
File.open("contas_geradas.csv", 'w') { |file| file.write(gera_conta_e_saldo) }
file = File.new("transacoes_geradas.csv", "w")
File.open("transacoes_geradas.csv", 'w') { |file| file.write(gera_conta_e_transacoes) }

