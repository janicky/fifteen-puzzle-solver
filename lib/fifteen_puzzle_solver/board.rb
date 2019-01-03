class FifteenPuzzleSolver::Board
  def initialize(blocks, width)
    @blocks = blocks
    @width = width
  end

  # Calculate dimensions
  def dimensions
    {
      width: @width,
      height: @blocks.count / @width,
    }
  end
end
