class Merge
  class << self
    def sort(arr)
      return arr if arr.length == 1
      middle = arr.length / 2
      left = sort(arr[0...middle])
      right = sort(arr[middle..-1])
      merge(left, right)
    end

    def merge(arr1, arr2)
      result = []
      until arr1.size == 0 || arr2.size == 0 do
          result << (arr1[0] <= arr2[0] ? arr1.shift : arr2.shift)
      end
      result + arr1 + arr2
    end
  end
end
