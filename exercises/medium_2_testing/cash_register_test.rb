require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @cash_reg = CashRegister.new(0)
  end

  # test accespt_money
  def test_accept_money
    transaction = Transaction.new(50)
    transaction.amount_paid = 50
    previous_total = @cash_reg.total_money
    @cash_reg.accept_money(transaction)
    current_total = @cash_reg.total_money
    assert_equal(previous_total + transaction.amount_paid, current_total)
  end
end
