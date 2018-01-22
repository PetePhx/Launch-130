=begin

Test Give Receipt Method - Cash Register

Write a test for method CashRegister#give_receipt that ensures it displays a
valid receipt.

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

  # give_receipt
  def test_give_receipt
    transaction = Transaction.new(50)
    transaction.amount_paid = 50
    assert_output("You've paid $50.\n") { @cash_reg.give_receipt(transaction) }
  end
end

# Running:
# 
# ========================================================================================|
# .
# Finished in 0.01908s
# 1 tests, 1 assertions, 0 failures, 0 errors, 0 skips
# ]2;[Minitest results] 1 tests
#
#
# Finished in 0.356070s, 2.8084 runs/s, 2.8084 assertions/s.
# 1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
