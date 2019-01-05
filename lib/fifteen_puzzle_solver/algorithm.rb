class FifteenPuzzleSolver::Algorithm
  attr_reader :status, :depth, :solution, :elapsed_time, :visited_nodes, :processed_nodes

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
    @visited_nodes = @explored.count
    @processed_nodes = @frontier.length
  end

  private

  def clock_time
    Process.clock_gettime(Process::CLOCK_MONOTONIC)
  end
end
