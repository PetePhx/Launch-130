=begin

Exception Assertions

Write a minitest assertion that will fail unless employee.hire raises a
NoExperienceError exception.

=end

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class NoExperienceError < StandardError; end

class Employee
  def hire
    raise NoExperienceError.new
  end

  def fire
    "OkThnxBye!"
  end
end

class RaiseTest < Minitest::Test
  def setup
    @employee = Employee.new
  end

  def test_raise
    assert_raises(NoExperienceError) { @employee.hire }
    assert_raises(NoExperienceError) { @employee.fire }
  end
end

# ===========================================================================|
# F
#
# Failure:
# RaiseTest#test_raise [/home/user/Launch/130_blocks_tests/exercises/easy_testing/06_exception_assertions.rb:34]:
# NoExperienceError expected but nothing was raised.
#
# bin/rails test home/user/Launch/130_blocks_tests/exercises/easy_testing/06_exception_assertions.rb:32
#
#
# Finished in 0.03967s
# 1 tests, 2 assertions, 1 failures, 0 errors, 0 skips
# ]2;[Minitest results] 1 tests
#
#
# Finished in 0.381698s, 2.6199 runs/s, 5.2397 assertions/s.
# 1 runs, 2 assertions, 1 failures, 0 errors, 0 skips
