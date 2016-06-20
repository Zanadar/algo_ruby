class Graph
  def initialize(graph)
    @graph = graph
  end

  def search(start, target, type: :bfs)
    type == :bfs ? do_bfs(start, target) : do_dfs(start, target)
  end

  private
  def do_dfs(start, target)
    search_stack = [start]
    while true
      current = search_stack.pop
      return false if current == nil
      return true if current == target

      children = (0...@graph.length).to_a.select do |i|
        @graph[current][i] == 1
      end
      search_stack = children + search_stack
    end
  end

  def do_bfs(start, target)
    search_queue = [start]
    while true
      current = search_queue.shift
      return false if current == nil
      return true if current == target

      children = (0...@graph.length).to_a.select do |i|
        @graph[current][i] == 1
      end

      search_queue = search_queue + children
    end
  end
end
