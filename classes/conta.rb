class Conta
	attr_accessor :numero, :saldo
	def initialize(numero, saldo_e_transacoes)
		@numero = numero
		@trasacoes_da_conta = saldo_e_transacoes
	end

	def aplica_transacoes
		@saldo = @trasacoes_da_conta.first
		if @trasacoes_da_conta.size != 1
			@trasacoes_da_conta.shift
			@trasacoes_da_conta.each do |t|
				@saldo = @saldo + t
				aplica_multa(t)
			end
		end
	end

	def aplica_multa(t)
		if (t < 0 && @saldo <0)
			@saldo = @saldo - 500
		end
	end
end