class FifteenPuzzleSolver
  def initialize(params)
    params.each do |key, value|
      instance_variable_set("@#{key}".to_sym, value)
    end

    validate
  end

  private

  def validate
    # Validate width
    unless @width
      raise Exception.new("Width can't be empty")
    end
    # Validate height
    unless @height
      raise Exception.new("Height can't be empty")
    end
    # Validate blocks
    if !@blocks || @blocks.count != @width * @height
      raise Exception.new("Invalid blocks count (expect #{@width * @height}, got #{@blocks.count})")
    end
  end
end

require "fifteen_puzzle_solver/board"
