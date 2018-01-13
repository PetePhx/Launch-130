=begin

Given our final Todo and TodoList classes from the previous assignment,
implement a TodoList#each method. This method should behave similarly to the
familiar Array#each, and the each method we built ourselves in an earlier
example. The TodoList#each should take a block, and yield each Todo object to
the block. Here's an example of how to use it:

=end

# Todolist#each method in lines 106-117 (give or take a few)

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    @todos << todo
  end

  alias_method :<<, :add

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def item_at(idx)
    check_index idx # or use @todos.fetch(idx)
    @todos[idx]
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(idx)
    check_index idx
    @todos.delete_at(idx)
    # @todos.delete(item_at(idx)) # alternative. it will delete all duplicates.
  end

  def check_index(idx)
    unless (0...self.size).cover?(idx)
      raise IndexError.new("Index #{idx} Out of Bound!")
    end
  end

  def to_s
    str = "---- #{title} ----\n"
    str += @todos.map(&:to_s).join("\n")
  end

  # def each
  #   idx = 0
  #   while idx < size
  #     yield(@todos[idx])
  #     idx +=1
  #   end
  # end

  #more idiomatic:
  def each
    @todos.each { |todo| yield(todo) }
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

list.each do |todo|
  puts todo                   # calls Todo#to_s
end

# The above should send each of the 3 Todo objects to puts, which will
# automatically invoke the Todo#to_s method. The output should be:
#
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym
