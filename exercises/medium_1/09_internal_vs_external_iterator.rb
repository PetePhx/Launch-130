=begin

In this exercise, your task is to create a new Enumerator object. When creating
a new Enumerator, you may define what values are iterated upon. We'll want to
create an Enumerator that can iterate over an infinite list of factorials. Once
you make this new Enumerator, test it out by printing out the first 7 factorial
values, starting with zero factorial.

More specifically, print the first 7 factorials by using an "External Iterator".
Once you have done so, reset your Enumerator. Finally, reprint those same 7
factorials using your Enumerator object as an "Internal Iterator".

=end

# y is the "yielder"
factorial = Enumerator.new do |y|
  n = 0
  fac = 1
  loop do
    y << fac
    n += 1
    fac *= n
  end
end

7.times { puts factorial.next }

# 1
# 1
# 2
# 6
# 24
# 120
# 720

# peeking at where we are:
puts
p factorial.peek
# 5040

# rewind the enumerator
factorial.rewind

puts
p factorial.peek
# 1

puts
factorial.take(7).each_with_index { |fac, idx| p [idx, fac]}
# [0, 1]
# [1, 1]
# [2, 2]
# [3, 6]
# [4, 24]
# [5, 120]
# [6, 720]

# using a lazy enumerator
lazy_factorial = Enumerator.new do |y|
  n = 0
  fac = 1
  loop do
    y << fac
    n += 1
    fac *= n
  end
end.lazy

puts
p lazy_factorial.with_index.map { |f, i| [i, f] }.first(7)
# [[0, 1], [1, 1], [2, 2], [3, 6], [4, 24], [5, 120], [6, 720]]
