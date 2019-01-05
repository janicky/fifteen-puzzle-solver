require "fifteen_puzzle_solver"
require_relative "../lib/fifteen_puzzle_solver/breadth_first_search"

RSpec.describe "BreadthFirstSearch" do
  before do
    # 1 2 3
    # 4 0 6
    # 7 5 8
    @board = FifteenPuzzleSolver::Board.new([1, 2, 3, 4, 0, 6, 7, 5, 8], 3)
    @bfs = FifteenPuzzleSolver::BreadthFirstSearch.new(@board, "rdul")
    @bfs.solve
  end

  it "correctly solve specified board" do
    expect(@bfs.status).to eq("solved")
  end

  it "returns correct solution path" do
    expect(@bfs.solution).to eq("dr")
  end

  it "returns correct recursion depth" do
    expect(@bfs.depth).to eq(2)
  end

  it "returns correct elapsed time" do
    expect(@bfs.elapsed).to be_within(0.0002).of(0.0001)
  end
end
