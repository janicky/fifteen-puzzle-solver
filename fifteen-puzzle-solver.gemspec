Gem::Specification.new do |s|
  s.name        = "fifteen-puzzle-solver"
  s.version     = "0.1.0"
  s.date        = "2019-01-06"
  s.summary     = "Fifteen Puzzle Solver"
  s.description = "Fifteen Puzzle Solver - BFS, DFS, A*"
  s.authors     = ["Patryk Janicki", "Konrad Jachimstal"]
  s.email       = "kontakt.janicki@gmail.com"
  s.files       = [
    "lib/fifteen_puzzle_solver.rb",
    "lib/fifteen_puzzle_solver/board.rb",
    "lib/fifteen_puzzle_solver/algorithm.rb",
    "lib/fifteen_puzzle_solver/node.rb",
    "lib/fifteen_puzzle_solver/breadth_first_search.rb",
    "lib/fifteen_puzzle_solver/depth_first_search.rb",
    "lib/fifteen_puzzle_solver/a_star_search.rb",
  ]
  s.homepage    =
    "https://github.com/janicky/fifteen-puzzle-solver"
  s.license     = "MIT"
end
