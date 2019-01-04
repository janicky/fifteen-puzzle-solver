class FifteenPuzzleSolver::Node
  attr_reader :board, :depth

  def initialize(parent, board)
    @parent = parent
    @board = board
    @depth = (parent ? parent.depth + 1 : 0)
  end

  def state
    @board.state
  end
end
