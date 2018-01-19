=begin

Nil Assertions

Write a minitest assertion that will fail if value is not nil.

=end

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class NilTest < Minitest::Test
  def setup
    @value1 = nil
    @value2 = "hi"
  end

  def test_nil
    assert_nil @value1
    assert_nil @value2
  end
end


# ===========================================================================|
# F
#
# Failure:
# NilTest#test_nil [/home/user/Launch/130_blocks_tests/exercises/easy_testing/03_nil_assertions.rb:21]:
# Expected "hi" to be nil.
#
# bin/rails test home/user/Launch/130_blocks_tests/exercises/easy_testing/03_nil_assertions.rb:19
#
#
# Finished in 0.02827s
# 1 tests, 2 assertions, 1 failures, 0 errors, 0 skips
# ]2;[Minitest results] 1 tests
#
#
# Finished in 0.400216s, 2.4987 runs/s, 4.9973 assertions/s.
# 1 runs, 2 assertions, 1 failures, 0 errors, 0 skips
