=begin

Exploring Procs, Lambdas, and Blocks: Returning

For this exercise, we'll be learning and practicing our knowledge of returning
from lambdas, procs, and implicit blocks. Run each group of code below: For your
answer to this exercise, write down your observations for each group of code.
After writing out those observations, write one final analysis that explains the
differences between procs, blocks, and lambdas.

=end

# Group 1
puts "\nGroup 1"
def check_return_with_proc
  my_proc = proc { return }
  my_proc.call
  puts "This will never output to screen."
end

check_return_with_proc
#
# Nothing is outputted. From inside a proc, `retrun` returns from the calling
# method.

# Group 2
puts "\nGroup 2"

my_proc = proc { return }

def check_return_with_proc_2(my_proc)
  my_proc.call
  puts "hey"
end

# check_return_with_proc_2(my_proc)
#
# Again, nothing is outputted. when returning from a proc, the execution flow
# also returns from the method that received the proc as an argument.

# The execution flow also stops processing the rest of the .rb file, as though
# exiting from the current scope.

# Group 3
puts "\nGroup 3"
def check_return_with_lambda
  my_lambda = lambda { return }
  my_lambda.call
  puts "This will be output to screen."
end

check_return_with_lambda
# This will be output to screen.

# Here, `return` returns from lambda object, and the execution flow continues
# within the method where lambda was called (i.e. line 49).

# Group 4
puts "\nGroup 4"
my_lambda = lambda { return }
def check_return_with_lambda(my_lambda)
  my_lambda.call
  puts "This will be output to screen."
end

check_return_with_lambda(my_lambda)
# This will be output to screen.

# As in previous case, returning from the lambda object passed in as an argument
# to the method returns the execution flow to the method (i.e. line 63).

# Group 5
puts "\nGroup 5"
def block_method_3
  yield
  puts "hello from the inside"
end

puts "hello from the outside"

block_method_3 { return }
# hello from the outside

# Similar to proc cases, returning from a block yielded by a method also returns
# from the method where block was yielded to.

# Final Analysis

# Returning from procs and blocks also returns the execution flow from the
# context where blocks and procs are defined. Therefore returning from a block
# or proc yielded or called inside the method, the execution flow also returns
# to outside the method. If the proc was defined at the top level, the
# execution flow halts quietly.

# Lambdas on the other hand have a less abrupt behavior in regards to
# `return`. When returning from a lambda called inside the method, the execution
# flow returns back and continues at the method scope.
