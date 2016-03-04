require 'pry'
class Quick
  class << self
    def sort(arr)
      return arr if arr.size <= 1

      pivot_v = arr.sample
      pivot_i = arr.index(pivot_v)

      arr.slice!(pivot_i)

      lesser = []
      greater = []

      arr.each do |x|
        if x <= pivot_v
          lesser << x
        else
          greater << x
        end
      end

      sort(lesser) + [pivot_v] + sort(greater)
    end

    def in_place(arr, lo, hi)
      return arr unless lo < hi
      p = partition(arr, lo, hi)
      binding.pry if !p
      in_place(arr, lo, p-1)
      in_place(arr, p+1, hi)
    end

    def partition(arr, lo, hi)
      pivot = arr[hi]
      i = lo
      for j in lo..hi-1
        if arr[j] <= pivot
          arr[i], arr[j] = arr[j], arr[i]
          i += 1
        end
      end
      arr[i], arr[hi] = arr[hi], arr[i]
      return i
    end
  end
end
