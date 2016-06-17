class MergeSort
  def initialize(arr)
    @arr = arr
  end

  def sort
    return @arr if @arr.length <= 1
    middle = @arr.length / 2
    left, right = @arr[0...middle], @arr[middle..-1]

    left = MergeSort.new(left).sort
    right = MergeSort.new(right).sort

    merge(left, right)
  end

  def merge(arr1, arr2)
    result = []
    while !arr1.empty? && !arr2.empty?
      if arr1[0] <= arr2[0]
        result << arr1.shift
      else
        result << arr2.shift
      end
    end
    result + arr1 + arr2
  end
end
