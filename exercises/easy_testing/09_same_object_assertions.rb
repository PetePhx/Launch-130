=begin

Same Object Assertions

Write a unit test that will fail if list and the return value of list.process
are different objects.

=end

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class List
  def process
    self
  end

  def process_2
    "hello"
  end
end

class SameTest < Minitest::Test
  def setup
    @list = List.new
  end

  def test_type
    assert_same(@list, @list.process)

    refute_same(@list, @list.process_2)
    refute_same(@list, List.new)

  end
end

# Running:

# ===========================================================================|
# .
# Finished in 0.02176s
# 1 tests, 3 assertions, 0 failures, 0 errors, 0 skips
# ]2;[Minitest results] 1 tests
#
#
# Finished in 0.535692s, 1.8667 runs/s, 5.6002 assertions/s.
# 1 runs, 3 assertions, 0 failures, 0 errors, 0 skips
