require_relative "algorithm.rb"

class FifteenPuzzleSolver::BreadthFirstSearch < FifteenPuzzleSolver::Algorithm
  def solve
    @frontier = Queue.new
    @frontier.push(FifteenPuzzleSolver::Node.new(nil, @board, nil))
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

      next if node.depth > 7

      node.board.neighbors(node, @order).each do |neighbor|
        @frontier.push(neighbor) unless @explored.include?(node.state)
      end
      @explored << node.state
    end
    save
  end
end
