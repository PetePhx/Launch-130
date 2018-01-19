=begin

Refutations

Write a unit test that will fail if 'xyz' is one of the elements in the Array
list:

=end

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class ExcludeTest < Minitest::Test
  def setup
    @list = ['xz', 'xy', 'yz', 'yxz', 'xwz', 'xzy']
  end

  def test_exclude
    refute_includes(@list, 'xyz')
  end
end

# Running:

# ===========================================================================|
# .
# Finished in 0.02591s
# 1 tests, 2 assertions, 0 failures, 0 errors, 0 skips
# ]2;[Minitest results] 1 tests
#
#
# Finished in 0.338066s, 2.9580 runs/s, 5.9160 assertions/s.
# 1 runs, 2 assertions, 0 failures, 0 errors, 0 skips
