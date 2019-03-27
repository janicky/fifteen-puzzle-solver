# fifteen-puzzle-solver
> Sliding puzzle that consists of a frame of numbered square tiles in random order with one tile missing.

In this algorithm, *missing tile* is representing by `0` value. In the BFS and DFS algorithms, the acronym is the order in which the state is searched.
### Algorithms
*  Breadth-First Search (`algorithm: 'bfs'`)
    * Left, Right, Up, Down (`acronym: 'lrud'`)
    * Right, Up, Left, Down (`acronym: 'ruld'`)
    * ... *other permutations*
*  Depth-First Search (`algorithm: 'dfs'`)
    * Up, Left, Down, Right (`acronym: 'uldr'`)
    * Down, Up, Left, Right (`acronym: 'dulr'`)
    * ... *other permutations*
*  A* Search (`algorithm: 'astr'`)
    * Manhattan (heuristic) (`acronym: 'manh'`)
    * Hamming (heuristic) (`acronym: 'hamm'`)
### Installation
Using the command line
```bash
$ gem install fifteen-puzzle-solver
```
or using bundler, add in your `Gemfile`
```ruby
gem 'fifteen-puzzle-solver'
```
Now require **fifteen_puzzle_solver** in your code:
```ruby
require "fifteen_puzzle_solver"
```
### Attributes
* `status`
    * `'ready'` - when class initialized and processing hasn't yet performed;
    * `'solved'` - when the solution was found
    * `'failed'` - when the solution wasn't found
* `max_depth` - maximum depth reached during processing
* `solution` - a string of characters denoting the empty field shifts
* `elapsed_time` - elapsed time in milliseconds
* `visited_nodes` - number of all visited nodes
* `processed_nodes` - number of all found nodes

An example of using attributes below.

### Example
Input puzzle state (`4x4`)

| **`1`** | **`2`**  | **`3`**  | **`4`**  |
| ------- | -------- | -------- | -------- |
| **`5`** | **`6`**  | **`7`**  | **`8`**  |
| **`9`** | **`10`** | **`11`** | **`12`** |
| **`0`** | **`14`** | **`15`** | **`13`** |

Representing by one-dimensional array:
```ruby
blocks = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 0, 14, 15, 13]
```

```ruby
require "fifteen_puzzle_solver"
# Create FifteenPuzzleSolver class instance using keyword arguments
fps = FifteenPuzzleSolver.new(blocks: blocks, width: 4, height: 4, algorithm: "astr", acronym: "manh")
# Start processing
fps.perform
# Get results
result = fps.result
puts result.status, result.solution, result.elapsed_time
# solved
# urdrrulldrulldrrurd
# 0.09785659998306073
```

### Class diagram
![Class Diagram](https://i.imgur.com/Ekidil3.png)
