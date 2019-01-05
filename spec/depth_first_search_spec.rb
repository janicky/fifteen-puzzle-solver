require "fifteen_puzzle_solver"
require_relative "../lib/fifteen_puzzle_solver/depth_first_search"

RSpec.describe "BreadthFirstSearch" do
  before do
    # 1 2 3
    # 4 0 6
    # 7 5 8
    @board = FifteenPuzzleSolver::Board.new([1, 2, 3, 4, 0, 6, 7, 5, 8], 3)
    @dfs = FifteenPuzzleSolver::DepthFirstSearch.new(@board, "rdul")
    @dfs.perform
  end
end