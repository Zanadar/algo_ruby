require 'pry'

class BinarySearch
  def initialize(arr)
    @arr = arr
  end

  def run(find)
    l, r = 0, @arr.length - 1
    while l <= r
      midpoint = mid(l, r)
      if @arr[midpoint] == find
        return midpoint
      elsif @arr[midpoint] < find
        l = midpoint + 1
      elsif @arr[midpoint] > find
        r = midpoint - 1
      end
    end
    return nil
  end

  def mid(l, r)
    (l + r) / 2
  end
end
