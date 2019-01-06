require "fifteen_puzzle_solver"

RSpec.describe "FifteenPuzzleSolver" do
  before do
    @blocks = [1, 2, 3, 4, 5, 6, 7, 0]
  end

  it "raise exception when empty width" do
    expect { FifteenPuzzleSolver.new(blocks: @blocks) }
      .to raise_error(Exception, "Width can't be empty")
  end

  it "raise exception when empty height" do
    expect { FifteenPuzzleSolver.new(blocks: @blocks, width: 1) }
      .to raise_error(Exception, "Height can't be empty")
  end

  it "raise exception when invalid blocks array" do
    invalid_blocks = [1, 2, 3, 4, 4.5, 5]
    message = "Blocks must be valid array of integers"
    expect { FifteenPuzzleSolver.new(blocks: invalid_blocks, width: 1, height: 1) }
      .to raise_error(Exception, message)

    invalid_blocks.delete(4.5)
    invalid_blocks << "string"
    expect { FifteenPuzzleSolver.new(blocks: invalid_blocks, width: 1, height: 1) }
      .to raise_error(Exception, message)
  end

  it "raise exception when invalid blocks count" do
    expect { FifteenPuzzleSolver.new(blocks: @blocks, width: 1, height: 1) }
      .to raise_error(Exception, "Invalid blocks count (should match to height and width)")
  end

  it "raise exception when empty or invalid algorithm" do
    expect { FifteenPuzzleSolver.new(blocks: @blocks, width: 4, height: 2) }
      .to raise_error(Exception, "Empty or invalid algorithm")
    expect { FifteenPuzzleSolver.new(blocks: @blocks, width: 4, height: 2, algorithm: "xxx") }
      .to raise_error(Exception, "Empty or invalid algorithm")
  end

  it "raise exception when invalid acronym" do
    message = "Invalid acronym (available: manh, hamm or letters [u,d,l,r])"
    params = { blocks: @blocks, width: 4, height: 2, algorithm: "bfs", acronym: "y" }
    expect { FifteenPuzzleSolver.new(params) }
      .to raise_error(Exception, message)
  end
end
