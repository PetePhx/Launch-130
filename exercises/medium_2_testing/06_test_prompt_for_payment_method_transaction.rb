=begin

Test Prompt For Payment Method- Transaction

Write a test that verifies that Transaction#prompt_for_payment sets the amount_paid correctly. We've changed the transaction class a bit to make testing this a bit easier. The Transaction#prompt_for_payment now reads as:

def prompt_for_payment(input: $stdin) # We've set a default parameter for stdin
  loop do
    puts "You owe $#{item_cost}.\nHow much are you paying?"
    @amount_paid = input.gets.chomp.to_f # notice that we call gets on that parameter
    break if valid_payment? && sufficient_payment?
    puts 'That is not the correct amount. ' \
         'Please make sure to pay the full cost.'
  end
end

=end

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

# Running:
#
# ========================================================================================|
# .
# Finished in 0.02841s
# 1 tests, 2 assertions, 0 failures, 0 errors, 0 skips
# ]2;[Minitest results] 1 tests
#
#
# Finished in 0.399273s, 2.5046 runs/s, 5.0091 assertions/s.
# 1 runs, 2 assertions, 0 failures, 0 errors, 0 skips
