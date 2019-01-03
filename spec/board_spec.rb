require "fifteen_puzzle_solver"
require_relative "../lib/fifteen_puzzle_solver/board"

RSpec.describe "Board" do
  before do
    # 1 2 3
    # 4 5 6
    # 7 0 8
    @board = FifteenPuzzleSolver::Board.new([1, 2, 3, 4, 5, 6, 7, 0, 8], 3)
  end

  it "calculate board dimensions" do
    expect(@board.width).to eq(3)
    expect(@board.height).to eq(3)
  end

  it "get element at position" do
    expect(@board.at_position(0, 0)).to eq(1)
    expect(@board.at_position(1, 0)).to eq(4)
    expect(@board.at_position(2, 1)).to eq(0)
  end
end
