=begin

Optional Blocks

Write a method that takes an optional block. If the block is specified, the method should execute it, and return the value returned by the block. If no block is specified, the method should simply return the String 'Does not compute.'.

Examples:

compute { 5 + 3 } == 8
compute { 'a' + 'b' } == 'ab'
compute == 'Does not compute.'

=end

def compute
  block_given? ? yield : "Does not compute."
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

# true
# true
# true

# Further Exploration
#
# Modify the compute method so it takes a single argument and yields that
# argument to the block. Provide at least 3 examples of calling this new version
# of compute, including a no-block call.

def compute(par)
  block_given? ? yield(par) : "Does not compute."
end

puts
p compute(1) { |i| i + 1 } == 2
p compute('hi') { |str| str + ' there' } == 'hi there'
p compute('ok') == 'Does not compute.'
# true
# true
# true

# alternatively, we can use the explicit form for passing a block:

def compute2(par, &block)
  block ? block.call(par) : "Does not compute."
end

puts
p compute2(1) { |i| i + 1 } == 2
p compute2('hi') { |str| str + ' there' } == 'hi there'
p compute2('ok') == 'Does not compute.'
# true
# true
# true
