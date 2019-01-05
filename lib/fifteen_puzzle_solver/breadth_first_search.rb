require_relative "algorithm.rb"

class FifteenPuzzleSolver::BreadthFirstSearch < FifteenPuzzleSolver::Algorithm
  def perform
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

      node.board.neighbors(node, @acronym).each do |neighbor|
        @frontier.push(neighbor) unless @explored.include?(node.state)
      end
      @explored << node.state
    end
    save
    @frontier.close
  end
end
