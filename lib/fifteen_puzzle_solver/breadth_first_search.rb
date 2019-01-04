class FifteenPuzzleSolver::BreadthFirstSearch
  def initialize(board, order)
    @board = board
    @order = order
  end

  def solve
    frontier = Queue.new
    frontier.push(FifteenPuzzleSolver::Node.new(nil, @board))
    explored = []

    i = 0
    while !frontier.empty?
      node = frontier.pop
      system "clear"
      puts "\n#{node.board.display}\n"
      puts "#{i}: #{frontier.length} - #{explored.count} [#{node.depth}]"

      if node.board.valid?
        puts "Solved!"
        break
      end

      node.board.neighbors(node, @order).each do |neighbor|
        frontier.push(neighbor) unless explored.include?(node.state)
      end
      explored << node.state
      i += 1
    end
  end
end
