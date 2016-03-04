require 'minitest/autorun'
require 'pry'
require_relative '../insertion_sort'
require_relative '../recursion'
require_relative '../merge_sort'
require_relative '../quick_sort'

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

class TestRecursive < MiniTest::Test

  def test_iter_factorial
    assert_equal 120, Recursive.iter_factorial(5)
  end

  def test_recur_factorial
    assert_equal 120, Recursive.recur_factorial(5)
    assert_equal 3628800, Recursive.recur_factorial(10)
  end

  def test_palindrome
    assert Recursive.palindrome("a")
    assert Recursive.palindrome("rotor")
    assert !Recursive.palindrome('motor')
  end

  def test_powers
    assert_equal Recursive.power(3, 0), 1
    assert_equal Recursive.power(3, 1), 3
    assert_equal Recursive.power(3, 2), 9
    assert_equal  1/3r, Recursive.power(3, -1)
  end
end

class TestQuickSort < MiniTest::Test
  def test_quick_sort
    myArr = Array.new(100) {rand(189)}
    sorted = myArr.sort

    assert_equal sorted, Quick.sort(myArr)
  end

  def test_in_place_quicksort
    myArr = Array.new(100) {rand(189)}
    sorted = myArr.sort

    assert_equal sorted, Quick.in_place(myArr, 0, myArr.length-1)
  end
end

class TestMergeSort < MiniTest::Test

  def test_merge_sort
    myArr = Array.new(100) {rand(189)}
    sorted = myArr.sort

    assert_equal sorted, Merge.sort(myArr)
  end
end


