def eech(arr)
  idx = 0
  while idx < arr.length
    yield(arr[idx])
    idx += 1
  end
  arr
end

eech([3, 2, 1, 0]) { |num| p num }

# eech([3, 2, 1, 0]).with_index { |num, idx| puts num } # doesn't work

p eech([1, 2, 3, 4, 5]) {|num| "do nothing"}.select{ |num| num.odd? }  # => [1, 3, 5]
