class SelectSort
  def self.sort(arr)
    arr.each_with_index do |x, i|
      rest = arr[i..-1]
      mindex = rest.find_index(rest.min) + i
      arr[i], arr[mindex] = arr[mindex], arr[i]
    end
  end
end
