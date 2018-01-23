=begin

Test swap method - Text

For this exercise you'll be given a sample text file and a starter class. The
sample text's contents will be saved as a String to an instance variable in the
starter class.

The Text class includes a #swap method that can be used to replace all
occurrences of one letter in the text with another letter. And for this exercise
we will swap all occurrences of 'a' with 'e'.

Your task is to write a test suite for class Text. In that test suite write a
test for the Text method swap. For this exercise, you are required to use the
minitest methods #setup and #teardown. The #setup method contains code that will
be executed before each test; #teardown contains code that will be executed
after each test.

=end

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

# require_relative '...'

class Text
  def initialize(text)
    @text = text
  end

  def swap(letter_one, letter_two)
    @text.gsub(letter_one, letter_two)
  end
end

class TextTest < MiniTest::Test
  def setup
    @file = File.open('text.txt', 'r')
  end

  # swap
  def test_swap
    str = @file.read
    text = Text.new(str)
    assert_equal(str.gsub('a', 'e'), text.swap('a', 'e'))
  end

  def teardown
    @file.close
  end
end

# Running:
#
# ========================================================================================|
# .
# Finished in 0.02589s
# 1 tests, 1 assertions, 0 failures, 0 errors, 0 skips
# ]2;[Minitest results] 1 tests
#
#
# Finished in 0.339469s, 2.9458 runs/s, 2.9458 assertions/s.
# 1 runs, 1 assertions, 0 failures, 0 errors, 0 skips


# For large files, we want to read and compare line by line:

class TextTest < MiniTest::Test
  def test_swap
    IO.foreach('text.txt') do |line|
      assert_equal(line.gsub('a', 'e'), Text.new(line).swap('a', 'e'))
    end
  end
end

# # Running:
#
# ========================================================================================|
# .
# Finished in 0.02638s
# 1 tests, 6 assertions, 0 failures, 0 errors, 0 skips
# ]2;[Minitest results] 1 tests
#
#
# Finished in 0.371570s, 2.6913 runs/s, 16.1477 assertions/s.
# 1 runs, 6 assertions, 0 failures, 0 errors, 0 skips
