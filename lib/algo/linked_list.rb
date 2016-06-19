class Node
  attr_accessor :next_node, :value

  def initialize(value)
    @value = value
    @next_node = nil
  end
end

class LinkedList
  attr_accessor :head

  def initialize()
    @head = nil
  end

  def push(value)
    new_node = Node.new(value)
    new_node.next_node = @head
    @head = new_node
  end

  def reverse
    prev = nil
    current = @head
    while current != nil
      next_node = current.next_node
      current.next_node = prev
      prev = current
      current = next_node
    end
    @head = prev
  end

  def head
    @head.value
  end
end
