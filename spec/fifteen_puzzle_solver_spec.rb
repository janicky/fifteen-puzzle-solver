require "fifteen_puzzle_solver"

RSpec.describe "FifteenPuzzleSolver" do
  it "raise exception when empty width" do
    expect { FifteenPuzzleSolver.new(blocks: [1, 2, 3]) }
      .to raise_error(Exception, "Width can't be empty")
  end

  it "raise exception when empty height" do
    expect { FifteenPuzzleSolver.new(blocks: [1, 2, 3], width: 1) }
      .to raise_error(Exception, "Height can't be empty")
  end

  # it "raise exception when invalid blocks count" do
  #   fps = FifteenPuzzleSolver.new(blocks: [1, 2, 3])
  # end
end
