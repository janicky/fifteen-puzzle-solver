require "fifteen_puzzle_solver"
require_relative "../lib/fifteen_puzzle_solver/breadth_first_search"

RSpec.describe "BreadthFirstSearch" do
  before do
    # 1 2 3
    # 4 0 6
    # 7 5 8
    @board = FifteenPuzzleSolver::Board.new([1, 2, 3, 4, 0, 6, 7, 5, 8], 3, 3)
    @bfs = FifteenPuzzleSolver::BreadthFirstSearch.new(@board, "rdul")
    @bfs.perform
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
    expect(@bfs.elapsed_time).not_to eq(0)
  end

  it "returns visited nodes and processed nodes" do
    expect(@bfs.visited_nodes).to be(7)
    expect(@bfs.processed_nodes).to be(12)
  end
end
