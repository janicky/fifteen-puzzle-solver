class FifteenPuzzleSolver::Algorithm
  attr_reader :status, :depth, :solution, :elapsed_time, :visited_nodes, :explored_nodes

  def initialize(board, order)
    @board = board
    @order = order
    @status = "ready"
  end

  protected

  def start
    @start_time = clock_time
  end

  def save
    @elapsed_time = clock_time - @start_time
    @status = "failed" unless @status == "solved"
    @visited_nodes = @frontier.length
    @explored_nodes = @explored.count
    @frontier.close
  end

  private

  def clock_time
    Process.clock_gettime(Process::CLOCK_MONOTONIC)
  end
end
