=begin

Find Missing Numbers

Write a method that takes a sorted array of integers as an argument, and returns
an array that includes all of the missing integers (in order) between the first
and last elements of the argument.

Examples:

missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
missing([1, 2, 3, 4]) == []
missing([1, 5]) == [2, 3, 4]
missing([6]) == []

=end

def missing(arr)
  arr[0].upto(arr[-1]).with_object([]) { |i, ob| ob << i unless arr.include?(i) }
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

# other short alternatives

def missing(arr)
  arr[0].upto(arr[-1]).reject { |i| arr.include?(i) }
end

def missing(arr)
  arr[0].upto(arr[-1]).partition { |i| arr.include?(i) }[1]
end

puts
p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

# Further Exploration

# Can you find other ways to solve this problem? What methods might prove
# useful? Can you find a way to solve this without using a method that requires
# a block?

def missing(arr)
  (arr[0]..arr[-1]).to_a - arr
end

puts
p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

# true
# true
# true
# true
