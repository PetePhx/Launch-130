require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @cash_reg = CashRegister.new(0)
  end

  # accept_money
  def test_accept_money
    transaction = Transaction.new(50)
    transaction.amount_paid = 50
    previous_total = @cash_reg.total_money
    @cash_reg.accept_money(transaction)
    current_total = @cash_reg.total_money
    assert_equal(previous_total + transaction.amount_paid, current_total)
  end

  # change
  def test_change
    transaction = Transaction.new(45)
    transaction.amount_paid = 50
    assert_equal(5, @cash_reg.change(transaction))
  end

  # give_receipt
  def test_give_receipt
    transaction = Transaction.new(50)
    transaction.amount_paid = 50
    assert_output("You've paid $50.\n") { @cash_reg.give_receipt(transaction) }
  end
end
