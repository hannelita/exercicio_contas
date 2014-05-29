require 'test/unit'
require_relative '../classes/conta'


class ContaTest < Test::Unit::TestCase

	def test_conta_so_com_saldo
		conta = Conta.new(1,[200])
		conta.aplica_transacoes
		assert_equal(200, conta.saldo)
	end

	def test_conta_com_transacoes_positivas
		conta = Conta.new(1,[200, 300, 100])
		conta.aplica_transacoes
		assert_equal(600, conta.saldo)
	end
	def test_conta_com_transacoes_positivas_e_negativas_com_saldo_sempre_positivo
		conta = Conta.new(1,[200, 300, -100])
		conta.aplica_transacoes
		assert_equal(400, conta.saldo)
	end
	def test_conta_com_transacoes_negativas_com_multa_por_debito
		conta = Conta.new(1,[200, -300])
		conta.aplica_transacoes
		assert_equal(-600, conta.saldo)
	end
	def test_conta_com_transacoes_negativas_sem_multa_por_deposito
		conta = Conta.new(1,[-200, 100])
		conta.aplica_transacoes
		assert_equal(-100, conta.saldo)
	end
	def test_conta_que_tera_saldo_zero
		conta = Conta.new(1,[-200, 200])
		conta.aplica_transacoes
		assert_equal(0, conta.saldo)
	end
end