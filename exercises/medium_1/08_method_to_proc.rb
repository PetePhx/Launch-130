=begin

Method to Proc

Fill in the missing part of the following code so we can convert an array of
integers to base 8. Use the comments for help in determining where to make your
modifications, and make sure to review the "Approach/Algorithm" section for this
exercise; it should prove useful.

def convert_to_base_8(n)
  n.method_name.method_name # replace these two method calls
end

# The correct type of argument must be used below
base8_proc = method(argument).to_proc

# We'll need a Proc object to make this code work. Replace `a_proc`
# with the correct object
[8,10,12,14,16,33].map(&a_proc)

The expected return value of map on this number array should be:

[10, 12, 14, 16, 20, 41]

=end

def convert_to_base_8(n)
  n.to_s(8).to_i
end

p convert_to_base_8(64)
# 100

base8_proc = method(:convert_to_base_8).to_proc
p base8_proc
# #<Proc:0x0000564f27852a10 (lambda)>

p [8,10,12,14,16,33].map(&base8_proc)
# [10, 12, 14, 16, 20, 41]
