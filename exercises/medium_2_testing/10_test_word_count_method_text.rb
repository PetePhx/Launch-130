=begin

Test word_count method - Text

Recall that in the last exercise we only had to test one method of our Text
class. One of the useful facets of the setup and teardown methods is that they
are automatically run before and after each test respectively. To show this
we'll be adding one more method to our Text class, word_count.

Write a test for this new method. Make sure to utilize the setup and teardown
methods for any file related operations.

=end

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class Text
  def initialize(text)
    @text = text
  end

  def swap(letter_one, letter_two)
    @text.gsub(letter_one, letter_two)
  end

  def word_count
    @text.split.count
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

  # word_count
  def test_word_count
    str = @file.read
    text = Text.new(str)
    assert_equal(str.split.size, text.word_count)
  end

  def teardown
    @file.close
    puts "\nFile has been closed: #{@file.closed?}"
  end
end

# # Running:
#
# File has been closed: true
# ============================================.
# File has been closed: true
# ============================================|
# .
# Finished in 0.03686s
# 2 tests, 2 assertions, 0 failures, 0 errors, 0 skips
# ]2;[Minitest results] 2 tests
#
# 
# Finished in 0.336639s, 5.9411 runs/s, 5.9411 assertions/s.
# 2 runs, 2 assertions, 0 failures, 0 errors, 0 skips
