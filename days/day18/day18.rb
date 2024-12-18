module Day18
  class GridOverTime
    def initialize(side_length, bytes)
      grid = init_grid(side_length)
      @grids = []
      @grids << grid
      bytes.each do |x, y|
        grid = Marshal.load(Marshal.dump(grid))
        grid[y][x] = "#"
        @grids << grid
      end
      @grids_size = @grids.size
    end

    def at(step)
      @grids[step]
    end

    private

    def init_grid(side_length)
      grid = []
      side_length.times { grid << ["."] * side_length }
      grid
    end
  end

  class Tile
    attr_reader :x, :y, :step, :path_size, :parent

    def initialize(x, y, step, path_size, parent)
      @x = x
      @y = y
      @step = step
      @path_size = path_size
      @parent = parent
    end

    def pos
      [x, y]
    end

    def to_key
      [x, y, step]
    end
  end

  def self.parse(input)
    input.lines.map { |l| l.scan(/\d+/).map(&:to_i) }
  end

  def self.roam(grid, side_length)
    queue = [Tile.new(0, 0, 0, 0, nil)]
    seen = {}
    while queue.any?
      tile = queue.shift
      return tile if tile.pos == [side_length - 1, side_length - 1]
      next if seen[tile.to_key] || tile.path_size > side_length**2

      seen[tile.to_key] = true
      [[1, 0], [0, 1], [-1, 0], [0, -1]].each do |dx, dy|
        nx, ny = tile.x + dx, tile.y + dy
        next if nx < 0 || nx >= side_length || ny < 0 || ny >= side_length || grid[ny][nx] == "#"

        queue << Tile.new(nx, ny, tile.step + 1, tile.path_size + 1, tile)
      end
    end
  end

  def self.part1(input, side_length, step_to_focus_on)
    grid_over_time = GridOverTime.new(side_length, parse(input))
    roam(grid_over_time.at(step_to_focus_on), side_length).path_size
  end

  def self.tile_to_path(tile)
    path = []
    while tile
      path << tile
      tile = tile.parent
    end
    path
  end

  def self.print_grid(grid, path)
  end

  def self.part2(input, side_length)
    grids = GridOverTime.new(side_length, parse(input))
    i = 0
    path = tile_to_path(roam(grids.at(i), side_length))
    parse(input).find do |step|
      i += 1
      if path.find { |t| t.pos == step } # we only recompute path if the current step break our previous solution
        path = tile_to_path(roam(grids.at(i), side_length))
      end
      path.empty?
    end
  end
end
