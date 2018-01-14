=begin

Implement the below methods.

Hint: use either TodoList#each or TodoList#select for the implementation.

TodoList Class      Description
--------------      -----------
find_by_title       takes a string as argument, and returns the first Todo object
                      that matches the argument. Return nil if no todo is found.
all_done            returns new TodoList object containing only the done items
all_not_done        returns new TodoList object containing only the not done items
mark_done           takes a string as argument, and marks the first Todo object
                      that matches the argument as done.
mark_all_done       mark every todo as done
mark_all_undone     mark every todo as not done

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
    self
  end

  def select
    list = TodoList.new(title)
    @todos.each { |todo| list.add(todo) if yield(todo) }
    list
  end

  def find_by_title(str)
    @todos.find { |todo| todo.title == str } # or
    # select { |todo| todo.title == str }.first
  end

  def all_done
    list = select { |todo| todo.done? }
  end

  def all_not_done
    list = select { |todo| !todo.done? }
  end

  def mark_done(str)
    todo = find_by_title(str)
    todo.done! unless todo.nil?
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
todo3.done!

list = TodoList.new("I <3 Doing Chores")
list.add(todo1)
list.add(todo2)
list.add(todo3)

p list.find_by_title("Buy milk")
# #<Todo:0x00005567956f1ad8 @title="Buy milk", @description="", @done=false>

p list.find_by_title("Do 20 500lbs situps. :)")
# nil

p list.all_done
# #<TodoList:0x0000560ed8b1ab88 @title="I <3 Doing Chores", @todos=[#<Todo:0x0000560ed8b1b650 @title="Go to gym", @description="", @done=true>]>

p list.all_not_done
# #<TodoList:0x00005591622df5c0 @title="I <3 Doing Chores",
#       @todos=[#<Todo:0x00005591622dfde0 @title="Buy milk", @description="", @done=false>,
#               # <Todo:0x00005591622dfd68 @title="Clean room", @description="", @done=false>]>

list.mark_done("Clean room")
p list.all_done
# #<TodoList:0x0000558db6d3e638 @title="I <3 Doing Chores",
#     @todos=[#<Todo:0x0000558db6d3f5d8 @title="Clean room", @description="", @done=true>,
              #<Todo:0x0000558db6d3f510 @title="Go to gym", @description="", @done=true>]>

list.mark_all_done
p list.all_not_done
# #<TodoList:0x000055cb0c543800 @title="I <3 Doing Chores", @todos=[]>

list.mark_all_undone
p list.all_done
# #<TodoList:0x00005649b31dada0 @title="I <3 Doing Chores", @todos=[]>
