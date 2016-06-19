class Graph
  class << self
    def search(adj_matrix, start, stop, type: :dfs)
      return -1 if type != :dfs && type != :bfs
      node_stack = [start]

      loop do
        curr_node = node_stack.pop
        return false if curr_node == nil
        return true if curr_node == stop

        children = (0..adj_matrix.length-1).to_a.select do |i|
          adj_matrix[curr_node][i] == 1
        end

        if type == :dfs
          node_stack = node_stack + children
        else
          node_stack = children + node_stack
        end
      end
    end
  end
end


