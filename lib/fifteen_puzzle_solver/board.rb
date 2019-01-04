require "digest/md5"

class FifteenPuzzleSolver::Board
  attr_reader :width, :height, :hashcode

  def initialize(blocks, width)
    @blocks = blocks
    @width = width
    @height = @blocks.count / width
    update_hashcode
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
  def neighbors(value, order)
    unless !!(/^[udlr]+$/is =~ order)
      raise Exception.new("Invalid order (only up, down, left or right)")
    end

    neighbors = []
    position = get_position(value)
    order.each_char do |direction|
      delta = direction_delta(direction)
      if can_move?(position[:x], position[:y], delta[:dx], delta[:dy])
        neighbor = at_position(position[:x] + delta[:dx], position[:y] + delta[:dy])
        neighbors << neighbor unless neighbor == nil
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

  private

  # Update hashcode
  def update_hashcode
    code = ""
    @blocks.each_with_index do |key, value|
      code << "/#{key}-#{value}/"
    end
    @hashcode = Digest::SHA256.hexdigest(code)
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
      update_hashcode
    end
  end
end
