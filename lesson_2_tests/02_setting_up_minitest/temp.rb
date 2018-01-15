# run with ruby, verify the Minitest is running.

require 'minitest/autorun'

class MyFirstTest < Minitest::Test
  def test_first_test
    assert true
  end
end

# MyFirstTest.new(nil).test_first_test
