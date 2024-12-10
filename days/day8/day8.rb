module Day8
  def self.parse(input)
    antennas = {}
    row_index = 0
    input.lines.each do |row|
      col_index = 0
      row.chars.each do |c|
        if /[A-Za-z0-9]/.match?(c)
          antennas[c] ||= []
          antennas[c] << [row_index, col_index]
        end
        col_index += 1
      end
      row_index += 1
    end
    antennas
  end

  def self.in_grid?(coord, max_row, max_col)
    coord[0] >= 0 && coord[0] < max_row && coord[1] >= 0 && coord[1] < max_col
  end

  def self.part1(input)
    antennas = parse(input)
    max_row, max_col = input.lines.size, input.lines[0].size - 1
    antinodes = {}
    antennas.each do |c, coords|
      coords.combination(2).each do |a, b|
        diff_row, diff_col = b[0] - a[0], b[1] - a[1]
        antinode1 = [a[0] - diff_row, a[1] - diff_col]
        antinodes[antinode1] = true if in_grid?(antinode1, max_row, max_col)
        antinode2 = [b[0] + diff_row, b[1] + diff_col]
        antinodes[antinode2] = true if in_grid?(antinode2, max_row, max_col)
      end
    end
    antinodes.size
  end

  def self.part2(input)
    antennas = parse(input)
    max_row, max_col = input.lines.size, input.lines[0].size - 1
    antinodes = {}
    antennas.each do |c, coords|
      coords.combination(2).each do |a, b|
        antinodes[a] = true
        antinodes[b] = true
        diff_row, diff_col = b[0] - a[0], b[1] - a[1]
        (1..).each do |coef|
          antinode = [a[0] - coef * diff_row, a[1] - coef * diff_col]
          in_grid?(antinode, max_row, max_col) ? (antinodes[antinode] = true) : break
        end
        (1..).each do |coef|
          antinode = [b[0] + coef * diff_row, b[1] + coef * diff_col]
          in_grid?(antinode, max_row, max_col) ? (antinodes[antinode] = true) : break
        end
      end
    end
    antinodes.size
  end
end
