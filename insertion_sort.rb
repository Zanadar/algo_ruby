require 'pry'

class InsertSort
  def self.sorted_insert(arr, ri, value)
    i = ri
    while i >= 0 && arr[i] > value
      arr[i+1] = arr[i]
      i -= 1
    end
    arr[i + 1] = value
  end

  def self.sort(arr)
    for i in 1..arr.length - 1
      sorted_insert(arr, i-1, arr[i])
    end
    arr
  end
end

