class FifteenPuzzleSolver::Board
  attr_reader :width, :height

  def initialize(blocks, width)
    @blocks = blocks
    @width = width
    @height = @blocks.count / width
  end

  # Get element value at position
  def at_position(row, column)
    @blocks[@width * row + column]
  end
end
