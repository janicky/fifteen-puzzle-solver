class FifteenPuzzleSolver::Algorithm
  attr_reader :status, :depth, :max_depth, :solution, :elapsed_time, :visited_nodes, :processed_nodes

  def initialize(board, acronym)
    @board = board
    @acronym = acronym
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
    @explored.clear
  end

  private

  def clock_time
    Process.clock_gettime(Process::CLOCK_MONOTONIC)
  end
end
