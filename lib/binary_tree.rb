require 'pry'

class Node
  include Enumerable

  attr_accessor :data, :left, :right

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

  def to_s
    self.map{|n| "{#{n.data}}"}.join("-")
  end
end
