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
    return nil if index < 0

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

  # Check if the board is valid
  def valid?
    return false unless @blocks.last == 0

    iterator = 1
    @blocks.each do |block|
      return false if block != iterator && block != 0

      iterator += 1
    end
    true
  end

  private

  # Get index by position
  def get_index(x, y)
    @height * y + x
  end

  # Check range exceeding
  def can_move?(x, y, dx, dy)
    x + dx >= 0 && y + dy >= 0 && x + dx < @width && y + dy < @height
  end

  # Move element by x and y difference
  def move_element(dx, dy)
    position = get_position(0)
    element_index = get_index(position[:x] + dx, position[:y] + dy)

    if element_index > 0 && can_move?(position[:x], position[:y], dx, dy)
      zero_index = get_index(position[:x], position[:y])
      @blocks[zero_index], @blocks[element_index] = @blocks[element_index], @blocks[zero_index]
    end
  end
end
