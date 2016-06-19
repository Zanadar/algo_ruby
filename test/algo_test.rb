$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/../lib")

require 'minitest/autorun'
require 'pry'
require 'algo'

class TestHashTable < MiniTest::Test
  def test_hash_table
    table = HashTable.new('this', "that")
    table['foob']="bar"
    table['food']='barfs'

    assert_equal "that", table['this']
    assert_equal "bar", table['foo']
    assert_equal "barfs", table['food']
  end
end

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

class TestMergeSort < MiniTest::Test

  def test_merge_sort
    myArr = Array.new(100) {rand(189)}
    sorted = myArr.sort

    assert_equal sorted, Merge.sort(myArr)
  end
end


class TestBinaryTree < Minitest::Test

  def test_to_s
    @root = Node.new(5)
    @root.left = Node.new(3)
    @root.right = Node.new(7)

    # assert_equal "{3}-{5}-{7}", @root.to_s
  end
end

class TestQuickSort < Minitest::Test
  def test_quicksort
    myArr = Array.new(10) {rand(100)}
    sorted = myArr.sort

    assert_equal sorted, QuickSort.sort(myArr)
  end
end

class TestMaxProfit < Minitest::Test
  def test_max_profit
    stock_prices_yesterday = [10, 7, 5, 8, 11, 9]

    max = MaxProfit.new(stock_prices_yesterday).get
    assert_throws MaxProfit.new([1])
    assert_equal 6, max
  end
end

class TestLinkedList < Minitest::Test
  def test_reverse_linked_list
    myList = LinkedList.new()

    [1, 2, 3, 4, 5].each do |val|
      myList.push(val)
    end
    assert_equal 5, myList.head

    myList.reverse

    assert_equal myList.head, 1
  end
end

class TestMergeSort < Minitest::Test
  def test_merge_sort
    myArr = Array.new(100) {rand(100)}
    sorted = myArr.sort

    assert_equal sorted, MergeSort.new(myArr).sort
  end
end

class TestBinarySearch < Minitest::Test
  def test_binary_search
    myArr = Array.new(100) {rand(100)}.sort.uniq!
    find = rand(100)


    assert_equal myArr.index(find), BinarySearch.new(myArr).run(find)
  end
end

class TestGraph < Minitest::Test
         #  A  B  C  D  E  F
  @@graph = [
           [0, 1, 1, 1, 0, 0],
           [0, 0, 0, 0, 1, 0],
           [0, 0, 0, 0, 0, 1],
           [0, 0, 0, 0, 0, 1],
           [0, 0, 0, 0, 0, 0],
           [0, 0, 0, 0, 0, 0]
          ]

  def test_dfs
    assert Graph.search(@@graph, 0, 5)
    assert Graph.search(@@graph, 0, 5, type: :bfs)
    assert_equal false, Graph.search(@@graph, 4, 5, type: :dfs)
    assert_equal (-1), Graph.search(@@graph, 4, 5, type: :bad)

  end
end

