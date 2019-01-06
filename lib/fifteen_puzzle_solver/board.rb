require "digest/md5"

class FifteenPuzzleSolver::Board
  attr_reader :width, :height

  def initialize(blocks, width, height)
    @blocks = blocks
    @width = width
    @height = height
  end

  # Get unique identifier
  def state
    @blocks.join
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
    delta = direction_delta(direction)
    move_element(delta[:dx], delta[:dy])
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

  # Return neighbors for board element
  def neighbors(parent, order)
    unless !!(/^[udlr]+$/is =~ order)
      raise Exception.new("Invalid order (only up, down, left or right)")
    end

    neighbors = []
    position = get_position(0)
    order.each_char do |direction|
      delta = direction_delta(direction)
      if can_move?(position[:x], position[:y], delta[:dx], delta[:dy])
        board = FifteenPuzzleSolver::Board.new(@blocks.dup, @width, @height)
        board.move(direction)
        neighbors << FifteenPuzzleSolver::Node.new(parent, board, direction)
      end
    end
    neighbors
  end

  # Display board in output
  def display
    output = ""
    @width.times do |y|
      @height.times do |x|
        output << at_position(x, y).to_s.center(5)
      end
      output << "\n"
    end
    output
  end

  # Return invalid blocks distance
  def invalid_blocks_distance
    distance = 0

    iterator = 1
    @blocks.each do |block|
      if block != iterator && block != 0
        distance += distance(block)
      end
      iterator += 1
    end
    distance
  end

  # Return difference between blocks and valid system
  def difference
    difference = 0
    valid_system = [*1...(@width * @height)] + [0]
    @blocks.each_with_index do |block, index|
      difference += 1 unless block == valid_system[index]
    end
    difference
  end

  private

  # Update state
  def update_state
    @state = @blocks.join
  end

  # Translate direction to delta
  def direction_delta(direction)
    case direction
    when "u", "U", "up"
      return { dx: 0, dy: -1 }
    when "d", "D", "down"
      return { dx: 0, dy: 1 }
    when "l", "L", "left"
      return { dx: -1, dy: 0 }
    when "r", "R", "right"
      return { dx: 1, dy: 0 }
    else
      raise Exception.new("Invalid direction (only up, down, left or right)")
    end
  end

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

    if element_index >= 0 && can_move?(position[:x], position[:y], dx, dy)
      zero_index = get_index(position[:x], position[:y])
      @blocks[zero_index], @blocks[element_index] = @blocks[element_index], @blocks[zero_index]
    end
  end

  # Return valid position for value
  def valid_position_for(value)
    return { x: @width - 1, y: @height - 1 } if value == 0

    {
      x: (value - 1) % @width,
      y: (value - 1) / @height,
    }
  end

  # Return distance between two blocks
  def distance(value)
    block1 = get_position(value)
    block2 = valid_position_for(value)
    (block1[:x] - block2[:x]).abs + (block1[:y] - block2[:y]).abs
  end
end
