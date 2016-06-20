$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/../lib")

require 'minitest/autorun'
require 'pry'
require 'algo'

class TestHashTable < MiniTest::Skip
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
    @root.insert(Node.new(3))
    @root.insert(Node.new(7))
    @root.insert(Node.new(1))
    @root.insert(Node.new(4))
    @root.insert(Node.new(2))
    @root.insert(Node.new(6))
    assert 3, @root.left.data
    assert 1, @root.left.left.data
    assert 2, @root.left.left.right.data
    assert 4, @root.left.right.data
    assert 7, @root.right.data
    assert 6, @root.right.left.data

    assert_equal Node.new(3).data, @root.search(3).data
    assert_equal nil, @root.search(13)

    tree = @root
    @root.print_tree_in_order

    puts
    BFS.levels(@root)


    # assert_equal [[5], [3, 7], [1, 2, 8, 9]], levels
  end
end

class TestQuickSort < Minitest::Test
  def test_quicksort
    myArr = Array.new(10) {rand(100)}
    sorted = myArr.sort

    assert_equal sorted, QuickSort.sort(myArr)
  end
end

class TestMaxProfit < Minitest::Skip
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
    graph = Graph.new(@@graph)
    assert graph.search( 0, 5)
    assert graph.search( 0, 5, type: :bfs)
    assert_equal false, graph.search( 4, 5, type: :dfs)

  end
end

