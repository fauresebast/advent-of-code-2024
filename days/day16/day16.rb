module Day16
  class Step
    attr_reader :pos, :direction, :cost, :parent

    def initialize(pos, direction, cost, parent)
      @pos = pos
      @direction = direction
      @cost = cost
      @parent = parent
    end

    def to_s
      "Step(#{pos}, #{direction}, #{cost}, #{parent.pos})"
    end

    def to_key
      [pos, direction]
    end

    def row
      @pos[0]
    end

    def col
      @pos[1]
    end
  end

  def self.parse(input)
    grid = input.lines.map { _1.chomp.chars }
    col = nil
    row = grid.index { |r| col = r.index { |c| c == "S" } }
    [grid, Step.new([row, col], :east, 0, nil)]
  end

  def self.opposite_direction?(a, b)
    (a == :north && b == :south) ||
      (a == :south && b == :north) ||
      (a == :east && b == :west) ||
      (a == :west && b == :east)
  end

  def self.roaming(input)
    grid, step = parse(input)
    queue = [step]
    seen_cost = {}
    best_paths = [Step.new(nil, nil, 999_999_999_999, nil)]
    while queue.any?
      queue.sort_by!(&:cost)
      step = queue.shift
      next if seen_cost[step.to_key] && seen_cost[step.to_key] < step.cost

      seen_cost[step.to_key] = step.cost
      if grid[step.row][step.col] == "E"
        current_best_path_cost = best_paths.first.cost
        if step.cost < current_best_path_cost
          best_paths = [step]
        elsif step.cost == current_best_path_cost
          best_paths << step
        end
      else
        [
          [step.row - 1, step.col, :north],
          [step.row + 1, step.col, :south],
          [step.row, step.col + 1, :east],
          [step.row, step.col - 1, :west]
        ].each do |r, c, d|
          next if grid[r][c] == "#" || opposite_direction?(d, step.direction)

          queue << Step.new([r, c], d, step.cost + 1 + ((step.direction == d) ? 0 : 1000), step)
        end
      end
    end
    best_paths
  end

  def self.part1(input)
    roaming(input).first.cost
  end

  def self.print_paths(input, best_tiles)
    input.lines.each_with_index do |row, row_index|
      line = ""
      row.chars.each_with_index do |c, col_index|
        line += best_tiles[[row_index, col_index]] ? "O" : c
      end
      puts line
    end
  end

  def self.part2(input)
    best_tiles = {}
    roaming(input).each do |path|
      while path
        best_tiles[path.pos] = true
        path = path.parent
      end
    end
    print_paths(input, best_tiles)
    best_tiles.size
  end
end
