require_relative "algorithm.rb"

class FifteenPuzzleSolver::DepthFirstSearch < FifteenPuzzleSolver::Algorithm
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

      next if @depth > 20

      node.board.neighbors(node, @order).reverse_each do |neighbor|
        @frontier << neighbor unless @explored.include?(node.state)
      end
      @explored << node.state
    end
    save
  end
end
