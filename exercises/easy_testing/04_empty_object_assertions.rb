=begin

Empty Object Assertions

Write a minitest assertion that will fail if the Array list is not empty.

=end

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class EmptyTest < Minitest::Test
  def setup
    @arr1 = []
    @arr2 = %w[I can haz test]
  end

  def test_empty
    assert_empty @arr1
    assert_empty @arr2
  end
end

# ===========================================================================|
# F
#
# Failure:
# EmptyTest#test_empty [/home/user/Launch/130_blocks_tests/exercises/easy_testing/04_empty_object_assertions.rb:21]:
# Expected ["I", "can", "haz", "test"] to be empty.
#
# bin/rails test home/user/Launch/130_blocks_tests/exercises/easy_testing/04_empty_object_assertions.rb:19
#
#
# Finished in 0.03269s
# 1 tests, 4 assertions, 1 failures, 0 errors, 0 skips
# ]2;[Minitest results] 1 tests
# 
#
# Finished in 0.333627s, 2.9974 runs/s, 11.9894 assertions/s.
# 1 runs, 4 assertions, 1 failures, 0 errors, 0 skips
