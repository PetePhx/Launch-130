=begin

Divisors

Write a method that returns a list of all of the divisors of the positive
integer passed in as an argument. The return value can be in any sequence you
wish.

Examples

divisors(1) == [1]
divisors(7) == [1, 7]
divisors(12) == [1, 2, 3, 4, 6, 12]
divisors(98) == [1, 2, 7, 14, 49, 98]
divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

=end

def divisors(num)
  1.upto(num/2).select { |i| num % i == 0 } + [num]
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
# p divisors(99400891) == [1, 9967, 9973, 99400891] # may take long

# Further Exploration

# You may have noticed that the final example took a few seconds, maybe even a
# minute or more, to complete. This shouldn't be a surprise as we aren't doing
# anything to optimize the algorithm. It's what is commonly called a brute force
# algorithm where you try every possible solution; these are easy to write, but
# they don't always produce fast results. They aren't necessarily bad solutions
# -- it depends on your needs -- but the speed of brute force algorithms should
# always be examined.

# How fast can you make your solution go? How big of a number can you quickly
# reduce to its divisors?

def divisors(num)
  first_half = 1.upto(Math::sqrt(num)).select { |i| num % i == 0 }
  second_half = first_half.reverse.map { |i| num / i }
  (first_half + second_half).uniq
end

puts
p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(9) == [1, 3, 9]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891]
p divisors(999962000357) == [1, 999979, 999983, 999962000357]
