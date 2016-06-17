class QuickSort
  class << self
    def sort(arr)
      # This is in place
      quick_sort(arr, 0, arr.length-1)
    end

    def quick_sort(arr, lo, hi)
      if lo < hi
        p = partition(arr, lo, hi)
        quick_sort(arr, lo, p-1)
        quick_sort(arr, p+1, hi)
      else
        return arr
      end
    end

    def partition(arr, lo, hi)
      pivot = arr[hi]
      i = lo
      (lo...hi).each do |x|
        if arr[x] <= pivot
          arr[x], arr[i] = arr[i], arr[x]
          i +=1
        end
      end
      arr[i], arr[hi] = arr[hi], arr[i]
      return i
    end
  end
end
