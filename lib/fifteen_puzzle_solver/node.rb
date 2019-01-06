class FifteenPuzzleSolver::Node
  attr_reader :board, :depth

  def initialize(parent, board, direction)
    @parent = parent
    @board = board
    @direction = direction
    @depth = (parent ? parent.depth + 1 : 0)
  end

  def state
    @board.state
  end

  def path
    return "" unless @parent

    @parent.path + @direction
  end

  def astar_function(heuristic)
    case heuristic
    when "manh"
      weight + @board.invalid_blocks_distance
    when "hamm"
      
    else
      1
    end
  end

  private

  def weight
    path.length
  end
end
