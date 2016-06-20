class Node
  include Enumerable

  attr_accessor :data, :left, :right, :distance

  def initialize(data)
    @data = data
  end

  def each(&block)
    left.each(&block) if left
    block.call(self)
    right.each(&block) if right
  end

  def <=>(other_node)
    data <=> other_node.data
  end

  def children
    [left, right]
  end

  def insert(node)
    if node.data > self.data
      if !right
        self.right = node
      else
        self.right.insert(node)
      end
    else
      if !left
        self.left = node
      else
        self.left.insert(node)
      end
    end
  end

  def to_s
    "{#{self.data}}"
  end

  def print_tree_in_order
    self.left.each{|n| puts n}
    puts data
    self.right.each{|n| puts n}
  end

  def print_tree_pre_order
    puts data
    self.left.each{|n| puts n}
    self.right.each{|n| puts n}
  end

  def search(value)
    if !self.data || value == self.data
      return self
    elsif value > self.data
      return right.search(value) if right
    else
      return left.search(value) if left
    end
  end
end

module BFS
  def BFS.levels(node)
    current_level = [node]
    next_level = []
    while !current_level.empty?
      current = current_level.shift
      if current
        print "#{current} "
        next_level = next_level + current.children
      end
      if current_level.empty?
        puts "\n"
        current_level, next_level = next_level, current_level
      end
    end
  end
end
