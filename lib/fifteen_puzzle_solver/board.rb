class FifteenPuzzleSolver::Board
  attr_reader :width, :height

  def initialize(blocks, width)
    @blocks = blocks
    @width = width
    @height = @blocks.count / width
  end

  # Get element value at position
  def at_position(x, y)
    index = get_index(x, y)
    return nil if index == nil

    @blocks[index]
  end

  # Get element position with specified value
  def get_position(value)
    {
      x: @blocks.index(value) % @width,
      y: @blocks.index(value) / @height,
    }
  end

  # Move zero-value element
  # def move(direction)

  # end

  private

  # Get index by position
  def get_index(x, y)
    index = @width * x + y
    return nil if index < 0

    index
  end

  # Move element by x and y difference
  # def move_element(dx, dy)
  #   position = get_position(0)
  #   @blocks
  # end
end
