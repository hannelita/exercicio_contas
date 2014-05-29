require 'test/unit'
require_relative '../calcula_balanco'
require_relative '../classes/processa_balanco'


class ProcessaBalancoTest < Test::Unit::TestCase
	def setup
		@arquivo_contas = File.open("contas_geradas.csv")
		@arquivo_transacoes = File.open("transacoes_geradas.csv")
	end

	def test_inicializa_com_arquivo_de_conta
		processa_balanco = ProcessaBalanco.new(@arquivo_contas, @arquivo_transacoes)
		assert_not_nil processa_balanco.arquivo_contas
	end
	def test_inicializa_com_arquivo_de_transacoes
		processa_balanco = ProcessaBalanco.new(@arquivo_contas, @arquivo_transacoes)
		assert_not_nil processa_balanco.arquivo_transacoes
	end

	def test_cria_hash_contas
		processa_balanco = ProcessaBalanco.new(@arquivo_contas, @arquivo_transacoes)
		assert_not_nil processa_balanco.contas
	end
	def test_arquivo_contas_invalido
		contas_invalido = File.open("./tests/contas_invalido.csv")
		assert_raise (NoMethodError) {ProcessaBalanco.new(contas_invalido, @arquivo_transacoes) }
	end
	def test_arquivo_transacoes_invalido
		transacoes_invalido = File.open("./tests/transacoes_invalido.csv")
		assert_raise (NoMethodError) {ProcessaBalanco.new(@arquivo_contas, transacoes_invalido) }
	end
	def test_extensao_incorreta
		contas_invalido = File.open("./tests/contas_invalido.cdv")
		assert_raise (RuntimeError) {ProcessaBalanco.new(contas_invalido, @arquivo_transacoes)}
	end
	def test_valor_incorreto_transacao
		transacoes_invalido = File.open("./tests/outras_transacoes_invalidas.csv")
		assert_raise (NoMethodError) {ProcessaBalanco.new(@arquivo_contas, transacoes_invalido) }
	end
	def test_valor_incorreto_conta
		contas_invalido = File.open("./tests/outras_contas_invalidas.csv")
		assert_raise (NoMethodError) {ProcessaBalanco.new(contas_invalido, @arquivo_transacoes) }
	end
	def test_csv_de_saida_criado
		processa_balanco = ProcessaBalanco.new(@arquivo_contas, @arquivo_transacoes)
		assert (File.exists?("balanco_gerado.csv"))
	end
end
