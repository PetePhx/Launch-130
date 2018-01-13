def redooce(arr, init = nil)
  return init if arr.empty?
  idx, acc = init.nil? ? [1, arr[0]] : [0, init]
  while idx < arr.length
    acc = yield(acc, arr[idx])
    idx += 1
  end
  acc
end

array = [1, 2, 3, 4, 5]

p redooce(array) { |acc, num| acc + num }                    # => 15
p redooce(array, 10) { |acc, num| acc + num }                # => 25
# redooce(array) { |acc, num| acc + num if num.odd? }
# undefined method `+' for nil:NilClass (NoMethodError)
