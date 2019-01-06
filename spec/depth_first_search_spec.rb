require "fifteen_puzzle_solver"
require_relative "../lib/fifteen_puzzle_solver/depth_first_search"

RSpec.describe "BreadthFirstSearch" do
  before do
    # 1 2 3
    # 4 0 6
    # 7 5 8
    @board = FifteenPuzzleSolver::Board.new([1, 2, 3, 4, 0, 6, 7, 5, 8], 3, 3)
    @dfs = FifteenPuzzleSolver::DepthFirstSearch.new(@board, "rdul")
    @dfs.perform
  end

  it "correctly solve specified board" do
    expect(@dfs.status).to eq("solved")
  end

  it "returns correct solution path" do
    expect(@dfs.solution).to eq("rdlurdlurd")
  end

  it "returns correct recursion depth" do
    expect(@dfs.depth).to eq(10)
  end

  it "returns correct elapsed time" do
    expect(@dfs.elapsed_time).not_to eq(0)
  end

  it "returns visited nodes and processed nodes" do
    expect(@dfs.visited_nodes).to be(14)
    expect(@dfs.processed_nodes).to be(17)
  end
end
