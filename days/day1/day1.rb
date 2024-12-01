module Day1
  def self.parse(input)
    input.lines.reduce([[], []]) do |acc, line|
      a, b = line.split.map(&:to_i)
      [acc[0] + [a], acc[1] + [b]]
    end
  end

  def self.part1(input)
    column_a, column_b = parse(input).map(&:sort)
    column_a.zip(column_b).sum { |a, b| (a - b).abs }
  end

  def self.part2(input)
    column_a, column_b = parse(input)
    column_a.sum { |a| a * column_b.count(a) }
  end
end
