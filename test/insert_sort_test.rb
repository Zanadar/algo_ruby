require 'minitest/autorun'
require_relative '../insertion_sort'

class TestInsertSort < MiniTest::Test

  def test_orderered_insert
    arr = [1, 2, 4, 5, 6]

    InsertSort.sorted_insert(arr, 4, 3 )

    assert_equal [1, 2, 3, 4, 5, 6], arr

    array = [3, 5, 7, 11, 13, 2, 9, 6]

    InsertSort.sorted_insert(array, 4, 2)

    assert_equal [2, 3, 5, 7, 11, 13, 9, 6], array
  end

  def test_sort
    myArr = Array.new(8) {rand(189)}

    sorted = myArr.sort

    assert_equal InsertSort.sort(myArr), sorted
  end
end


