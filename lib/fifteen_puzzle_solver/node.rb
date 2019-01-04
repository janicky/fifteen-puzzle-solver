class FifteenPuzzleSolver::Node
  def initialize(parent, board)
    @parent = parent
    @board = board
  end

  def hashcode
    @board.hashcode
  end
end
