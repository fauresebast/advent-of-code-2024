module Day12
  def self.parse(input)
    input.lines.map { |line| line.chomp.chars }
  end

  def self.compute_regions(input, method)
    grid = parse(input)
    max_row, max_col = grid.size, grid[0].size
    regions = []
    cells_seen = {}
    max_row.times do |row|
      max_col.times do |col|
        current_cell = [row, col]
        next if cells_seen[current_cell]

        current_region_symbol = grid[row][col]
        queue = [current_cell]
        region = {symbol: current_region_symbol, cells: {}}
        while queue.any?
          flood_fill_current_cell = queue.shift
          next if cells_seen[flood_fill_current_cell]

          cells_seen[flood_fill_current_cell] = true
          region[:cells][flood_fill_current_cell] = true
          [[-1, 0], [0, -1], [0, 1], [1, 0]].each do |drow, dcol|
            nrow, ncol = flood_fill_current_cell[0] + drow, flood_fill_current_cell[1] + dcol
            next if nrow < 0 || nrow >= max_row || ncol < 0 || ncol >= max_col || grid[nrow][ncol] != current_region_symbol

            queue << [nrow, ncol]
          end
        end
        region[:area] = region[:cells].size
        region[:fences] = method.call(region[:cells])
        regions << region
      end
    end
    regions.sum { |r| r[:area] * r[:fences] }
  end

  def self.compute_fences(cells)
    cells.keys.sum do |cell|
      [[-1, 0], [0, -1], [0, 1], [1, 0]].count do |drow, dcol|
        cells[[cell[0] + drow, cell[1] + dcol]].nil?
      end
    end
  end

  def self.part1(input)
    compute_regions(input, method(:compute_fences))
  end

  def self.join_fences(fences, crossing_fences)
    i = 0
    while i < fences.size
      current = fences[i]
      to_join = fences.find { |f| current.last == f.first }
      if to_join.nil? || (crossing_fences.find { |f| current.last == f.last } && crossing_fences.find { |f| current.last == f.first })
        i += 1
      else
        fences[i][1] = to_join.last
        fences.delete(to_join)
        i = 0
      end
    end
    fences
  end

  def self.compute_fences_sections(cells)
    horizontal_fences = []
    vertical_fences = []
    cells.keys.map do |cell|
      if cells[[cell[0] - 1, cell[1]]].nil? # fence above
        horizontal_fences << [[cell[0], cell[1]], [cell[0], cell[1] + 1]]
      end
      if cells[[cell[0], cell[1] + 1]].nil? # fence right
        vertical_fences << [[cell[0], cell[1] + 1], [cell[0] + 1, cell[1] + 1]]
      end
      if cells[[cell[0] + 1, cell[1]]].nil? # fence bottom
        horizontal_fences << [[cell[0] + 1, cell[1]], [cell[0] + 1, cell[1] + 1]]
      end
      if cells[[cell[0], cell[1] - 1]].nil? # fence left
        vertical_fences << [[cell[0], cell[1]], [cell[0] + 1, cell[1]]]
      end
    end
    join_fences(horizontal_fences.uniq, vertical_fences.uniq).size + join_fences(vertical_fences.uniq, horizontal_fences.uniq).size
  end

  def self.part2(input)
    compute_regions(input, method(:compute_fences_sections))
  end
end
