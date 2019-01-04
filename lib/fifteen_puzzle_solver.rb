class FifteenPuzzleSolver
  def initialize
    @board = Board.new([*0..8].shuffle, 3)
  end
end

require "fifteen_puzzle_solver/board"
