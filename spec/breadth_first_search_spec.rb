require "fifteen_puzzle_solver"
require_relative "../lib/fifteen_puzzle_solver/breadth_first_search"

RSpec.describe "BreadthFirstSearch" do
  before do
    # 1 2 3
    # 4 5 6
    # 7 0 8
    @board = FifteenPuzzleSolver::Board.new([9, 8, 3, 2, 11, 10, 12, 7, 13, 14, 4, 6, 15, 5, 0, 1], 4)
    @bfs = FifteenPuzzleSolver::BreadthFirstSearch.new(@board, "rdul")
  end

  it "solve puzzle" do
    @bfs.solve
  end
end
