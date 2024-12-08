module Day8
  def self.parse(input)
    antennas = {}
    input.lines.each_with_index do |row, row_index|
      row.chars.each_with_index do |c, col_index|
        next unless /[A-Za-z0-9]/.match?(c)

        antennas[c] ||= []
        antennas[c] << [row_index, col_index]
      end
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

  def self.print_grid(input, antinodes)
    input.lines.each_with_index do |line, row_index|
      to_print = ""
      line.chars.each_with_index do |c, col_index|
        to_print += antinodes[[row_index, col_index]] ? "#" : c
      end
      puts to_print
    end
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
