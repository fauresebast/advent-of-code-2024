module Day11
  def self.parse(input)
    input.split.map(&:to_i)
  end

  def self.part1(input)
    stones = parse(input)
    25.times do
      stones = stones.flat_map do |stone|
        if stone.zero?
          1
        elsif (stone.digits.size % 2).zero?
          stone = stone.to_s
          [stone[...stone.size / 2], stone[stone.size / 2..]].map(&:to_i)
        else
          stone * 2024
        end
      end
    end
    stones.size
  end

  def self.part2(input)
  end
end
