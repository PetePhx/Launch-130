require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # to_a
  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  # size
  def test_size
    assert_equal(3, @list.size)
  end

  # first
  def test_first
    assert_equal(@todo1, @list.first)
  end

  # last
  def test_last
    assert_equal(@todo3, @list.last)
  end

  # shift
  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  # pop
  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  # done?
  def test_done
    assert_equal(false, @list.done?)
    @todos.each { |todo| todo.done! }
    assert_equal(true, @list.done?)
  end

  # TypeError
  def test_type_error
    assert_raises(TypeError) { @list << "hi" }
  end

  # <<
  def test_shovel
    todo4 = Todo.new("hi")
    @list << todo4
    assert_equal([*@todos, todo4], @list.to_a)
  end

  # Equivalence of add and <<
  # Had to define #== for TodoList and Todo classes
  # see lines 33-35, 153-155 in todolist.rb
  def test_add_shovel
    list = Marshal.load(Marshal.dump(@list))
    todo4 = Todo.new("hello")
    list.add(todo4)
    @list << todo4
    assert_equal(list, @list)
  end

  # item_at
  def test_item_at
    assert_equal(@todo2, @list.item_at(1))
    assert_raises(IndexError) { @list.item_at(3) }
  end

  # mark_done_at
  def test_mark_done_at
    @list.mark_done_at(1)
    assert_equal(true, @todo2.done?)
    assert_raises(IndexError) { @list.mark_done_at(3) }
  end

  # mark_undone_at
  def test_mark_undone_at
    @todo2.done!
    @list.mark_undone_at(1)
    assert_equal(false, @todo2.done?)
    assert_raises(IndexError) { @list.mark_undone_at(3) }
  end

  # done!
  def test_done
    @list.done!
    assert_equal([true, true, true], @list.to_a.map(&:done?))
  end

  # remove_at
  def test_remove_at
    @list.remove_at(1)
    assert_equal([@todo1, @todo3], @list.to_a)
    assert_raises(IndexError) { @list.remove_at(2) }
  end

  # to_s
  # could also use squiggly line <<~OUTPUT.chomp to get rid of
  # empty spaces (ruby versions > 2.3)
  def test_to_s
    output = <<-OUTPUT.chomp.gsub(/^\s+/, "")
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  # to_s with a done Todo
  def test_to_s_with_done
    @todo2.done!
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  # to_s with all todos done
  def test_to_s_with_all_done
    @list.mark_all_done
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  # each
  def test_each
    @list.each { |todo| todo.done! }
    assert_equal([true, true, true], @list.to_a.map(&:done?))
  end

  # each return value
  def test_each_return
    var = @list.each { "hello" }
    assert_equal(var, @list)
  end

  # select
  # again, we are using TodoList#== and Todo#== methods
  # (lines 34, 154 in todolist.rb)
  def test_select
    @todo2.done!
    other_list = TodoList.new("Today's Todos")
    other_list.add(@todo2)
    assert_equal(other_list, @list.select { |todo| todo.done? })
  end
end
