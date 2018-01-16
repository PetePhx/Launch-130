require 'minitest/autorun'

class EqualityTest < Minitest::Test
  def test_value_equality
    str1 = "something"
    str2 = "something"

    assert_equal(str1, str2)
    assert_same(str1, str2)
  end
end

# 1) Failure:
# EqualityTest#test_value_equality [equality.rb:9]:
# Expected "something" (oid=47268047752640) to be the same as "something"
# (oid=47268047752660).

class Car
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end
end

class CarTest < MiniTest::Test
  def test_value_equality
    car1 = Car.new
    car2 = Car.new

    car1.name = "Kim"
    car2.name = "Kim"

    assert_equal(car1, car2)
  end
end

# 2) Failure:
# CarTest#test_value_equality [equality_test.rb:34]:
# No visible difference in the Car#inspect output.
# You should look at the implementation of #== on Car or its members.
# #<Car:0xXXXXXX @wheels=4, @name="Kim">

class Car2
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end

  def ==(other)                       # assert_equal would fail without this method
    other.is_a?(Car2) && name == other.name
  end
end

class CarTest2 < MiniTest::Test
  def test_value_equality
    car1 = Car2.new
    car2 = Car2.new

    car1.name = "Kim"
    car2.name = "Kim"

    assert_equal(car1, car2)          # this will pass
    assert_same(car1, car2)           # this will fail
  end
end

# Failure:
# CarTest2#test_value_equality [equality_test.rb:65]:
# Expected #<Car2:0x0000557f36cf8bf8 @wheels=4, @name="Kim"> (oid=47002434389500)
# to be the same as #<Car2:0x0000557f36cf8c20 @wheels=4, @name="Kim">
# (oid=47002434389520).
