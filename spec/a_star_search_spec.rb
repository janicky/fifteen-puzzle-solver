require "fifteen_puzzle_solver"
require_relative "../lib/fifteen_puzzle_solver/a_star_search"

RSpec.describe "AStarSearch" do
  before do
    # 1 2 3
    # 4 0 6
    # 7 5 8
    @board = FifteenPuzzleSolver::Board.new([1, 2, 3, 4, 0, 6, 7, 5, 8], 3)
    @astr = FifteenPuzzleSolver::AStarSearch.new(@board, "manh")
    @astr.perform
  end
end
