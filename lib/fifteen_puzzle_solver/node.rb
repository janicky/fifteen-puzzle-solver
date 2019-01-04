class FifteenPuzzleSolver::Node
  attr_reader :board

  def initialize(parent, board)
    @parent = parent
    @board = board
  end

  def state
    @board.state
  end
end
