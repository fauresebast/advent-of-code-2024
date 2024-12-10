module Day10
  def self.parse(input)
    input.split("\n").map { |line| line.chars.map { |c| (c == ".") ? -42 : c.to_i } }
  end

  def self.trails_start(grid)
    trails = []
    row_index = 0
    grid.each do |row|
      col_index = 0
      row.each do |height|
        trails << [[row_index, col_index]] if height.zero?
        col_index += 1
      end
      row_index += 1
    end
    trails
  end

  def self.hike(input)
    grid = parse(input)
    max_row, max_col = grid.size, grid[0].size
    trails = trails_start(grid)
    trailheads = {}
    while trails.any?
      *path, current = trails.pop
      row, col = current
      current_height = grid[row][col]
      if current_height == 9
        trailheads[path + [current]] = true
      else
        [[-1, 0], [0, -1], [1, 0], [0, 1]].each do |drow, dcol|
          nr, nc = row + drow, col + dcol
          next if nr < 0 || nr >= max_row || nc < 0 || nc >= max_col || grid[nr][nc] != current_height + 1

          trails << path + [current] + [[nr, nc]]
        end
      end
    end
    trailheads
  end

  def self.part1(input)
    hike(input).keys.uniq { |path| [path.first, path.last] }.size
  end

  def self.part2(input)
    hike(input).size
  end
end
