=begin

One final refinement we should make is to a previous method: TodoList#each.
Notice that it, too, doesn't follow the pattern. One quirk with Array#each and
Hash#each is that it returns the original object.

Update the TodoList#each method so that it returns the original (not new)
TodoList object.

Hint: returning a new TodoList object is easy: just instantiate it. But how do
we return the "current" object?

=end

# adding `self` in line 109 to return the calling object.

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
    self
  end

  def select
    list = TodoList.new(title)
    @todos.each { |todo| list.add(todo) if yield(todo) }
    list
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

puts list.each { "hi" }
