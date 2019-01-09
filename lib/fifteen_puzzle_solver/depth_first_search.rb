require_relative "algorithm.rb"

class FifteenPuzzleSolver::DepthFirstSearch < FifteenPuzzleSolver::Algorithm
  def perform
    @frontier = [FifteenPuzzleSolver::Node.new(nil, @board, nil)]
    @explored = []

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

      if @depth < 25
        node.board.neighbors(node, @acronym).reverse_each do |neighbor|
          @frontier << neighbor unless @explored.include?(neighbor.state)
        end
      end
      @explored << node.state
    end
    save
    @frontier.clear
  end
end
