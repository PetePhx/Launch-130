=begin

Kind Assertions

Write a minitest assertion that will fail if the class of value is not Numeric
or one of Numeric's subclasses (e.g., Integer, Fixnum, Float, etc).

=end

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class KindTest < Minitest::Test
  def setup
    @value1 = Numeric.new
    @value2 = 2.5
    @value3 = Object.new
    @value4 = "okie dokie"
  end

  def test_kind
    assert_kind_of(Numeric, @value1)
    assert_kind_of(Numeric, @value2)

    refute_kind_of(Numeric, @value3)
    refute_kind_of(Numeric, @value4)
  end
end

# Running:

# ===========================================================================|
# .
# Finished in 0.03847s
# 1 tests, 4 assertions, 0 failures, 0 errors, 0 skips
# ]2;[Minitest results] 1 tests
#
#
# Finished in 0.381133s, 2.6238 runs/s, 10.4950 assertions/s.
# 1 runs, 4 assertions, 0 failures, 0 errors, 0 skips
