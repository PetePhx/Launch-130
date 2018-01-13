def selekt(arr)
  idx = 0
  out = []
  while idx < arr.length
    out << arr[idx] if yield(arr[idx])
    idx += 1
  end
  out
end

# shorter format:

def selekt(arr)
  while (idx||=-1; idx += 1) < arr.length
    (out||=[]) << arr[idx] if yield(arr[idx])
  end
  out
end

p selekt((1..10).to_a) { |i| i.odd? } # [1, 3, 5, 7, 9]
p selekt((1..10).to_a) { |i| i.even? } # [2, 4, 6, 8, 10]
