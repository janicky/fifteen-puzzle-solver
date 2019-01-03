require "fifteen_puzzle_solver"
require_relative "../lib/fifteen_puzzle_solver/board"

RSpec.describe "Board" do
  before do
    @board = FifteenPuzzleSolver::Board.new([1, 2, 3, 4, 5, 6, 7, 0, 8], 3)
  end

  it "calculate board dimensions" do
    expect(@board.dimensions[:width]).to eq(3)
    expect(@board.dimensions[:height]).to eq(3)
  end
end
