=begin

Boolean Assertions

Write a minitest assertion that will fail if the value.odd? is not true.

=end

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class BooleanTest < Minitest::Test
  def setup
    @value1 = 1
    @value2 = 2
  end

  def test_odd
    assert(@value1.odd?, "#{@value1} is not odd.")
    assert(@value2.odd?, "#{@value2} is not odd.")
  end
end

# ===========================================================================|
# F
#
# Failure:
# BooleanTest#test_odd [/home/user/Launch/130_blocks_tests/exercises/easy_testing/01_boolean_assertions.rb:21]:
# 2 is not odd.
#
# bin/rails test home/user/Launch/130_blocks_tests/exercises/easy_testing/01_boolean_assertions.rb:19
#
#
# Finished in 0.02564s
# 1 tests, 2 assertions, 1 failures, 0 errors, 0 skips
# ]2;[Minitest results] 1 tests
#
#
# Finished in 0.319367s, 3.1312 runs/s, 6.2624 assertions/s.
# 1 runs, 2 assertions, 1 failures, 0 errors, 0 skips
