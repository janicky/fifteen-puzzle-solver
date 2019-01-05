class FifteenPuzzleSolver::Algorithm
  attr_reader :status, :depth, :solution, :length, :elapsed

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
    @elapsed = clock_time - @start_time
    @status = "failed" unless @status == "solved"
    @frontier.close
  end

  private

  def clock_time
    Process.clock_gettime(Process::CLOCK_MONOTONIC)
  end
end
