=begin

Write a method that takes an array as an argument, and a block that returns true
or false depending on the value of the array element passed to it. The method
should return a count of the number of times the block returns true.

You may not use Array#count or Enumerable#count in your solution.

=end

def count(arr)
  arr.each_with_object([0]) { |elm, obj| obj[0] += 1 if yield(elm) }.first
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2

# Further Exploration

# Write a version of the count method that meets the conditions of this
# exercise, but also does not use each, loop, while, or until.

def count(arr)
  0.upto(arr.size - 1).with_object([0]) { |i, obj| obj[0] += 1 if yield(arr[i]) }.first
end

puts
p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2

# also using #select or #map

def count(arr)
  arr.map { |elm| yield(elm) ? 1 : 0 }.sum
end

puts
p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2
