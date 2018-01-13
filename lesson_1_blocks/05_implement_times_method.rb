# puts 5.times { :nothing }

def tymes(num)
  counter = 0
  while counter < num
    yield(counter)
    counter += 1
  end
  num
end

tymes(4) { |i| puts 2 * i }
