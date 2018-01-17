=begin

Enumerable Class Creation

Assume we have a Tree class that implements a binary tree.

class Tree
  ...
end

A binary tree is just one of many forms of collections, such as Arrays, Hashes,
Stacks, Sets, and more. All of these collection classes include the Enumerable
module, which means they have access to an each method, as well as many other
iterative methods such as map, reduce, select, and more.

For this exercise, modify the Tree class to support the methods of Enumerable.
You do not have to actually implement any methods -- just show the methods that
you must provide.

=end

# assuming the `leaves` structure contains all the tree elements enumerated by
# some sort of index 0 to size - 1

class Tree
  include Enumerable
  attr_accessor :leaves

  def each
    0.upto(leaves.size - 1) { |idx| yield(leaves[idx]) }
  end
end
