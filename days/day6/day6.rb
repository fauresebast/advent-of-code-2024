module Day6
  class Guard
    attr_accessor :row, :col
    def initialize(row, col)
      @direction = :up
      @row = row
      @col = col
    end

    def to_s
      "(#{@row}, #{@col}) " + direction_char
    end

    def update_direction!
      directions = [:up, :right, :down, :left]
      @direction = directions[(directions.index(@direction) + 1) % 4]
    end

    def next_pos
      case @direction
      when :up
        [@row - 1, @col]
      when :right
        [@row, @col + 1]
      when :down
        [@row + 1, @col]
      when :left
        [@row, @col - 1]
      end
    end

    def direction_char
      case @direction
      when :up
        "^"
      when :right
        ">"
      when :down
        "v"
      when :left
        "<"
      end
    end

    def in_grid?(max_row, max_col)
      @row >= 0 && @col >= 0 && @row < max_row && @col < max_col
    end
  end

  def self.parse(input)
    grid = input.lines.map(&:chars)
    col = 0
    row = grid.index { col = _1.index("^") }
    [grid, Guard.new(row, col)]
  end

  def self.print_grid(grid, visited, guard)
    (0...grid.size).each do |row_index|
      line = ""
      (0...grid[0].size).each do |col_index|
        if guard.row == row_index && guard.col == col_index
          line += guard.direction_char
        elsif visited[[row_index, col_index]]
          line += "X"
        elsif grid[row_index]
          line += grid[row_index][col_index].to_s
        end
      end
      puts line
    end
    puts "=" * grid[0].size
  end

  def self.part1(input)
    grid, guard = parse(input)
    max_row, max_col = grid.size, grid[0].size
    visited = {}
    while guard.in_grid?(max_row, max_col)
      visited[[guard.row, guard.col]] ||= 0
      visited[[guard.row, guard.col]] += 1
      next_row, next_col = guard.next_pos
      if grid[next_row] && grid[next_row][next_col] == "#"
        guard.update_direction!
        next_row, next_col = guard.next_pos
      end
      guard.row = next_row
      guard.col = next_col
      # print_grid(grid, visited, guard)
    end
    visited.size - 1
  end

  def self.part2(input)
  end
end
