=begin

Included Object Assertions

Write a minitest assertion that will fail if the 'xyz' is not in the Array list.

=end

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class IncludeTest < Minitest::Test
  def setup
    @list1 = ['xyz']
    @list2 = ['zyx']
  end

  def test_include
    assert_includes @list1, 'xyz'
    assert_includes @list2, 'xyz'
  end
end

# ===========================================================================|
# F
#
# Failure:
# IcludeTest#test_include [/home/user/Launch/130_blocks_tests/exercises/easy_testing/05_included_object_assertions.rb:21]:
# Expected ["zyx"] to include "xyz".
#
# bin/rails test home/user/Launch/130_blocks_tests/exercises/easy_testing/05_included_object_assertions.rb:19
#
#
# Finished in 0.02755s
# 1 tests, 4 assertions, 1 failures, 0 errors, 0 skips
# ]2;[Minitest results] 1 tests
#
#
# Finished in 0.475192s, 2.1044 runs/s, 8.4177 assertions/s.
# 1 runs, 4 assertions, 1 failures, 0 errors, 0 skips
