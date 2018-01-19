=begin

Equality Assertions

Write a minitest assertion that will fail if value.downcase does not return
'xyz'.

=end

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class EqualityTest < Minitest::Test
  def setup
    @value1 = 'XYZ'
    @value2 = 'hello'
  end

  def test_xyz
    assert_equal('xyz', @value1.downcase)
    assert_equal('xyz', @value2.downcase)
  end
end


# ===========================================================================|
# F
#
# Failure:
# EqualityTest#test_xyz [/home/user/Launch/130_blocks_tests/exercises/easy_testing/02_equality_assertions.rb:22]:
# Expected: "xyz"
#   Actual: "hello"
#
# bin/rails test home/user/Launch/130_blocks_tests/exercises/easy_testing/02_equality_assertions.rb:20
#
#
# Finished in 0.02796s
# 1 tests, 2 assertions, 1 failures, 0 errors, 0 skips
# ]2;[Minitest results] 1 tests
#
#
# Finished in 0.454396s, 2.2007 runs/s, 4.4014 assertions/s.
# 1 runs, 2 assertions, 1 failures, 0 errors, 0 skips
