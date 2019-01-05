class FifteenPuzzleSolver::Algorithm
  attr_reader :status, :depth, :solution, :length

  def initialize(board, order)
    @board = board
    @order = order
  end
end
