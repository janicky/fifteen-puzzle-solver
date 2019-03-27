require "fifteen_puzzle_solver"
require_relative "../lib/fifteen_puzzle_solver/a_star_search"

RSpec.describe "AStarSearch" do
  before do
    # 2 0 3
    # 1 4 6
    # 7 5 8
    @board = FifteenPuzzleSolver::Board.new([2, 0, 3, 1, 4, 6, 7, 5, 8], 3, 3)
    @astr = FifteenPuzzleSolver::AStarSearch.new(@board, "manh")
    @astr.perform
  end

  it "correctly solve specified board" do
    expect(@astr.status).to eq("solved")
  end

  it "returns correct solution path" do
    expect(@astr.solution).to eq("ldrdr")
  end

  it "returns correct recursion depth" do
    expect(@astr.depth).to eq(5)
  end

  it "returns correct elapsed time" do
    expect(@astr.elapsed_time).not_to eq(0)
  end

  it "returns visited nodes and processed nodes" do
    expect(@astr.visited_nodes).to be(5)
    expect(@astr.processed_nodes).to be(6)
  end
end
