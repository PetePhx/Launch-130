=begin

In this assignment, you are to build a TodoList#select method, very similar to
Array#select or the select method we built ourselves earlier. Take a look at the
following code examples for how it should behave:

=end


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
    check_index idx
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

  def each
    @todos.each { |todo| yield(todo) }
  end

  def select
    @todos.select { |todo| yield(todo) }
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

results = list.select { |todo| todo.done? }    # you need to implement this method

puts results.inspect

# If you run that code, you should see an output that looks something like this:

# [#<Todo:0x007fd88c0ad9f0 @title="Buy milk", @description="", @done=true>]

# That's an array which contains all done todos from list. In this case, there's
# only 1 todo that's done, so there's only one element in the array.
