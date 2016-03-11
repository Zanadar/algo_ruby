def binarySearch(arr, target)
  internalArr = arr.sort
  min = 0
  max = arr.length
  while min <= max
    guess = (min + max) / 2
    if arr[guess] == target
      return guess
    elsif arr[guess] < target
      min = guess + 1
    else
      max = guess - 1
    end
  end
  return -1
end

def mergeSort(arr)
  minIndex = 0
  _, *rest = arr
  arr.each_with_index do |x, i|
     minIndex = i
     x, min =
  end
end


myArr = *(1..100)
randomArr = myArr.shuffle
puts "Enter your target number:"
target = gets.chomp.to_i
puts "Index of the #{target} is #{binarySearch(randomArr, target)}"

