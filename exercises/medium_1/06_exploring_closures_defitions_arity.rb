=begin
Definition and Arity

For this exercise, we'll be learning and practicing our knowledge of the arity
of lambdas, procs, and implicit blocks. Two groups of code also deal with the
definition of a Proc and a Lambda, and the differences between the two. Run each
group of code below: For your answer to this exercise, write down your
observations for each group of code. After writing out those observations, write
one final analysis that explains the differences between procs, blocks, and
lambdas.

=end

# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
# #<Proc:0x0000563a3ec892f8@/home/.../06_exploring_closures_defitions_arity.rb:15>
puts my_proc.class
# Proc
my_proc.call
# This is a .
my_proc.call('cat')
# This is a cat.

# Group 2
puts
my_lambda = lambda { |thing| puts "This is a #{thing}" }
my_second_lambda = -> (thing) { puts "This is a #{thing}" }
puts my_lambda
# #<Proc:0x0000563a3ec882e0@/.../06_exploring_closures_defitions_arity.rb:27 (lambda)>
puts my_second_lambda
# #<Proc:0x0000563a3ec88290@/.../06_exploring_closures_defitions_arity.rb:28 (lambda)>
puts my_lambda.class
# Proc
my_lambda.call('dog')
# This is a dog
# my_lambda.call
# 23:in `block in <main>': wrong number of arguments (given 0, expected 1) (ArgumentError)
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}" }
# 39:in `<main>': uninitialized constant Lambda (NameError)

# Group 3
puts
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
# This is a .
# block_method_1('seal')
# 45:in `block_method_1': no block given (yield) (LocalJumpError)

# Group 4
puts
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
# This is a turtle.
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
# This is a turtle and a .
block_method_2('turtle') { puts "This is a #{animal}."}
# undefined local variable or method `animal' for main:Object (NameError)

# Observations:

# Group 1:
# Procs are defined using proc {...} syntax (in addition to Proc.new).
# Procs are objects of the Proc class.
# Procs are permissive in terms of the numebr of arguments supplied to them.

# Group 2:
# Lambdas are defined either with lambda {...} or -> (..) {...} syntanx.
# Lambdas are also objects of the Proc class.
# Lambdas are strict in terms of number of arguments supplied to them.
# Lambdas cannot be defined using Lambda.new syntax.

# Group 3:
# Blocks are permissive in terms of number of arguments supplied to them.
# When `yield`ing, a block has to be supplied to the method to prevent LocalJumpError.

# Group 4
# Blocks are permissive in terms of number of arguments supplied (missing or extra).
# Blocks can't access the calling method scope directly.

# Final Analysis

# Blocks and Procs are permissive in terms of the number of arguments supplied
# to them (arity), as opposed to Lambdas with strict rules for arity.
# Procs and Lambdas are objects of the Proc class. Blocks are not objects. Procs
# can be defined using:
# Proc.new or proc {...} syntax, but there is no Lambda.new syntax.
# Lambdas can be defined using lambda {...} or -> (..) {...} syntax. Closures
# (blocks, procs, lambdas) don't have direct access to the yielding method's
# scope.
