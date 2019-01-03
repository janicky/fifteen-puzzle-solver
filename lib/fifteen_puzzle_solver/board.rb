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
  def move(direction)
    case direction
    when "u", "U", "up"
      move_element(0, -1)
    when "d", "D", "down"
      move_element(0, 1)
    when "l", "L", "left"
      move_element(-1, 0)
    when "r", "R", "right"
      move_element(1, 0)
    else
      raise Exception.new("Invalid direction (only up, down, left or right)")
    end
  end

  private

  # Get index by position
  def get_index(x, y)
    index = @height * y + x
    return nil if index < 0

    index
  end

  # Move element by x and y difference
  def move_element(dx, dy)
    position = get_position(0)
    element_index = get_index(position[:x] + dx, position[:y] + dy)
    puts element_index
    unless element_index == nil
      zero_index = get_index(position[:x], position[:y])
      @blocks[zero_index], @blocks[element_index] = @blocks[element_index], @blocks[zero_index]
    end
  end
end
