=begin

Test Accept Money Method - Cash Register

We now have the foundation of our CashRegister test class set up. Let's start
testing! We'll start with the CashRegister#accept_money method. Write a test for
the #accept_money method.

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

# Running:
#
# ========================================================================================|
# .
# Finished in 0.02757s
# 1 tests, 1 assertions, 0 failures, 0 errors, 0 skips
# ]2;[Minitest results] 1 tests
#
#
# Finished in 0.348405s, 2.8702 runs/s, 2.8702 assertions/s.
# 1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
