def hello
  puts "hello!"
end

# hello {puts "hi"} # "hello!"

def echo_with_yield(str)
  yield if block_given?
  puts str
end

# echo_with_yield("hello") { puts "world" }

# echo_with_yield("hello")

def say(words)
  yield if block_given?
  puts "> " + words
end

# say("hi there") do
#   system("clear")
# end

def increment(num)
  if block_given?
    yield(num + 1)
  else
    num + 1
  end
end

# increment(5) { |n| puts n }

# wrong number of block arguments

def test
  yield(1, 2)          # passing 2 block arguments at block invocation time
end

# test { |num| puts num } # prints 1

def test
  yield(1)
end

# test { |x, y| puts "#{x}-#{y}" } # 1-

# before/after

def compare(str)
  puts "Before: #{str}"
  after = yield(str)
  puts "After: #{after}"
end

# compare("hi") { |wrd| wrd.upcase }

# sandwich code

def time_it
  time_before = Time.now
  yield
  time_after = Time.now

  puts "It took #{time_after - time_before} seconds."
end

# time_it { sleep(3) } # It took 3.000166662 seconds.
# time_it { "hello world" } # It took 1.927e-06 seconds.


# Explicit MEthod Parameter

def test(&block)
  puts "what's a &block: #{block}"
end

test { sleep(3) }
