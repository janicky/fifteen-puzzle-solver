class FifteenPuzzleSolver
  def initialize
    @board = Board.new([*0..8].shuffle, 3)
  end

  def interaction
    continue = true
    while continue
      system "clear"
      puts @board.display
      case Interaction.read_char
      when "\e[A"
        @board.move("up")
      when "\e[B"
        @board.move("down")
      when "\e[C"
        @board.move("right")
      when "\e[D"
        @board.move("left")
      else
        continue = false
      end
    end
  end
end

require "fifteen_puzzle_solver/board"
require "fifteen_puzzle_solver/interaction"
