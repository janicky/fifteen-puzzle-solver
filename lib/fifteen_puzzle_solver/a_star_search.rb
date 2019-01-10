require_relative "algorithm.rb"

class FifteenPuzzleSolver::AStarSearch < FifteenPuzzleSolver::Algorithm
  def perform
    @frontier = [FifteenPuzzleSolver::Node.new(nil, @board, nil)]

    start
    while !@frontier.empty?
      node = @frontier.pop
      @depth = node.depth
      @max_depth = @depth if @depth > @max_depth

      if node.board.valid?
        @solution = node.path
        @status = "solved"
        break
      end

      neighbors = node.board.neighbors(node, "udlr")
      heuristic_sort(@acronym, neighbors)
      add_to_frontier(neighbors)

      @explored << node.state
    end
    save
    @frontier.clear
  end

  private

  def heuristic_sort(heuristic, nodes)
    nodes.sort! { |a, b| a.astar_function(heuristic) <=> b.astar_function(heuristic) }
  end

  def add_to_frontier(nodes)
    nodes.reverse_each do |node|
      unless @explored.include?(node.state)
        if @frontier.any? && @frontier.last.astar_function(@acronym) < node.astar_function(@acronym)
          @frontier.insert(0, node)
        else
          @frontier << node
        end
      end
    end
  end
end
