require_relative "algorithm.rb"

class FifteenPuzzleSolver::AStarSearch < FifteenPuzzleSolver::Algorithm
  def perform
    @frontier = [FifteenPuzzleSolver::Node.new(nil, @board, nil)]
    @explored = []

    start
    while !@frontier.empty?
      node = @frontier.pop
      @depth = node.depth

      if node.board.valid?
        @solution = node.path
        @status = "solved"
        break
      end

      neighbors = node.board.neighbors(node, "udlr")
      heuristic_sort(@acronym, neighbors)

      neighbors.reverse_each do |neighbor|
        next if @explored.include?(node.state)
        unless @frontier.&last.astar_function < node.astar_function
          @frontier << neighbor
        else 
          @frontier.insert(0, neighbor)
        end
      end
      @explored << node.state
    end
    save
  end

  private

  def heuristic_sort(heuristic, nodes)
    nodes.sort! { |a, b| a.astar_function(heuristic) <=> b.astar_function(heuristic) }
  end
end
