=begin

Test Change Method - Cash Register

Write a test for the method, CashRegister#change.

=end

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @cash_reg = CashRegister.new(0)
  end

  # accespt_money
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
end

# Running:
#
# .========================================================================================|
# .
# Finished in 0.03040s
# 2 tests, 2 assertions, 0 failures, 0 errors, 0 skips
# ]2;[Minitest results] 2 tests
#
#
# Finished in 0.372239s, 5.3729 runs/s, 5.3729 assertions/s.
# 2 runs, 2 assertions, 0 failures, 0 errors, 0 skips
