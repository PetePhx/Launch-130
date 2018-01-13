=begin

Your next task is to refine our TodoList#select method so that it still behaves
the same, except instead of returning an Array object, it returns a TodoList
object.

Hint: notice that Array#select and Hash#select both return a new object. It's
not a destructive action. The original object is left alone, and a new object is
returned.

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

puts results.inspect

# #<TodoList:0x0000556f2ebb6a78 @title="Today's Todos", @todos=[#<Todo:0x0000556f2ebb76a8 @title="Buy milk", @description="", @done=true>]>
