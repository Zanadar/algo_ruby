require 'pry'
myArr = Array.new(100) { rand(1..17) }

def countSort(arr)
  n = arr.length
  count = Hash.new(0)
  arr.each do |x|
    count[x] += 1
  end
  return count
end


puts countSort(myArr)
