class FifteenPuzzleSolver
  def initialize(blocks, width, height, algorithm, acronym)
    @blocks = blocks
    @width = width
    @height = height
    @algorithm = algorithm
    @acronym = acronym

    validate
  end

  private

  def validate
    unless @block.count == @width * @height
      raise Exception.new("Invalid blocks count (expect #{@width * @height}, got #{@blocks.count})")
    end
  end
end

require "fifteen_puzzle_solver/board"
