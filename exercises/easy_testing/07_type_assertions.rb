=begin

Type Assertions

Write a minitest assertion that will fail if value is not an instance of the
Numeric class exactly. value may not be an instance of one of Numeric's
superclasses.

=end

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TypeTest < Minitest::Test
  def setup
    @value1 = Numeric.new
    @value2 = 2
    @value3 = Object.new
  end

  def test_type
    assert_instance_of(Numeric, @value1)
    
    refute_instance_of(Numeric, @value2)
    refute_instance_of(Numeric, @value3)
  end
end

# Running:

# ===========================================================================|
# .
# Finished in 0.02403s
# 1 tests, 3 assertions, 0 failures, 0 errors, 0 skips
# ]2;[Minitest results] 1 tests
#
#
# Finished in 0.400439s, 2.4973 runs/s, 7.4918 assertions/s.
# 1 runs, 3 assertions, 0 failures, 0 errors, 0 skips
