=begin

Alter Prompt For Payment Method - Transaction

You may have noticed something when running the test for the previous exercise.
And that is that our minitest output wasn't that clean. We have some residual
output from the Transaction#prompt_for_payment method.

Run options: --seed 52842

# Running:

You owe $30.
How much are you paying?
.

Finished in 0.001783s, 560.7402 runs/s, 560.7402 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips

Transaction#prompt_for_payment has a call to Kernel#puts and that output is
showing up when we run our test. Your task for this exercise is to make it so
that we have "clean" output when running this test. We want to see something
like this:

Run options: --seed 4957

# Running:

.

Finished in 0.000919s, 1087.9984 runs/s, 1087.9984 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips

=end

# Since we ran the Transaction#prompt_for_payment within the assert_output block
# the output was clean:

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'transaction'

class Transaction
  def prompt_for_payment(input: $stdin) # We've set a default parameter for stdin
    loop do
      puts "You owe $#{item_cost}.\nHow much are you paying?"
      @amount_paid = input.gets.chomp.to_f # notice that we call gets on that parameter
      break if valid_payment? && sufficient_payment?
      puts 'That is not the correct amount. ' \
           'Please make sure to pay the full cost.'
    end
  end
end

class TransactionTest < MiniTest::Test
  def setup
    @transaction = Transaction.new(100)
  end

  def test_prompt_for_payment
    io = StringIO.new("80\n100\n", "r")
    assert_output("You owe $100.\nHow much are you paying?\n" \
      "That is not the correct amount. Please make sure to pay the full cost.\n" \
      "You owe $100.\nHow much are you paying?\n") do
      @transaction.prompt_for_payment(input: io)
    end
    assert_equal(100, @transaction.amount_paid)
  end
end

# Started with run options --seed 17697
#
#
# Progress: |Run options: --seed 17697
#
# # Running:
#
# ========================================================================================|
# .
# Finished in 0.03089s
# 1 tests, 2 assertions, 0 failures, 0 errors, 0 skips
# ]2;[Minitest results] 1 tests
#
#
# Finished in 0.353264s, 2.8307 runs/s, 5.6615 assertions/s.
# 1 runs, 2 assertions, 0 failures, 0 errors, 0 skips

# wihtout using the assert_output block, we would be adding input and output as
# parameters for #prompt_for_payment:

class Transaction
  def prompt_for_payment(input: $stdin, output: $stdout)
    loop do
      output.puts "You owe $#{item_cost}.\nHow much are you paying?"
      @amount_paid = input.gets.chomp.to_f
      break if valid_payment? && sufficient_payment?
      output.puts 'That is not the correct amount. ' \
           'Please make sure to pay the full cost.'
    end
  end
end

class TransactionTest < MiniTest::Test
  def setup
    @transaction = Transaction.new(100)
  end

  def test_prompt_for_payment
    io_in = StringIO.new("100\n", mode='r')
    io_out = StringIO.new(mode='w')
    @transaction.prompt_for_payment(input: io_in, output: io_out)

    assert_equal(100, @transaction.amount_paid)
  end
end

# Running:
#
# ========================================================================================|
# .
# Finished in 0.03387s
# 1 tests, 1 assertions, 0 failures, 0 errors, 0 skips
# ]2;[Minitest results] 1 tests
#
#
# Finished in 0.449705s, 2.2237 runs/s, 2.2237 assertions/s.
# 1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
