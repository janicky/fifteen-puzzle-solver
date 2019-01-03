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
    expect(@board.at_position(1, 0)).to eq(2)
    expect(@board.at_position(2, 1)).to eq(6)
    expect(@board.at_position(1, 2)).to eq(0)
    expect(@board.at_position(-1, -1)).to be_nil
    expect(@board.at_position(5, 5)).to be_nil
  end

  it "get element position by value" do
    expect(@board.get_position(1)).to eq(x: 0, y: 0)
    expect(@board.get_position(5)).to eq(x: 1, y: 1)
    expect(@board.get_position(8)).to eq(x: 2, y: 2)
    expect(@board.get_position(6)).to eq(x: 2, y: 1)
  end

  it "move element in specified direction (up)" do
    expect(@board.at_position(1, 1)).to eq(5)
    expect(@board.at_position(1, 2)).to eq(0)
    @board.move("up")
    expect(@board.at_position(1, 1)).to eq(0)
    expect(@board.at_position(1, 2)).to eq(5)
  end

  it "move element in specified direction (down)" do
    expect(@board.at_position(1, 2)).to eq(0)
    @board.move("down")
    expect(@board.at_position(1, 2)).to eq(0)
  end

  it "move element in specified direction (left)" do
    expect(@board.at_position(1, 2)).to eq(0)
    @board.move("left")
    @board.move("left")
    expect(@board.at_position(0, 2)).to eq(0)
  end
end
