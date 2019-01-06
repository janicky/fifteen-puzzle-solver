class FifteenPuzzleSolver
  def initialize(params)
    # blocks, width, height, algorithm, acronym
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
    # Validate if blocks are integers
    if !defined?(@blocks) || !@blocks.is_a?(Array) || !@blocks.all? { |e| e.is_a?(Integer) }
      raise Exception.new("Blocks must be valid array of integers")
    end
    # Validate blocks
    if !@blocks || @blocks.count != @width * @height
      raise Exception.new("Invalid blocks count (should match to height and width)")
    end
    # Validate algorithm
    if !defined?(@algorithm) || !%w[bfs dfs astr].include?(@algorithm)
      raise Exception.new("Empty or invalid algorithm")
    end
    # Valid acronym for bfs or dfs algorithm
    if %w[bfs dfs].include?(@algorithm) && !(/^[udlr]+$/is =~ @acronym)
      raise Exception.new("Invalid acronym for bfs or dfs algorithm")
    end
    # Valid acronym for astr algorithm
    if @algorithm == "astr" && !%w[manh hamm].include?(@acronym)
      raise Exception.new("Invalid acronym for astr algorithm")
    end
  end
end

require "fifteen_puzzle_solver/board"
