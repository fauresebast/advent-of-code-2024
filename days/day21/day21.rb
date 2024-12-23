module Day21
  KEYBOARD = {
    "0" => [3, 1],
    "A" => [3, 2],
    "1" => [2, 0],
    "2" => [2, 1],
    "3" => [2, 2],
    "4" => [1, 0],
    "5" => [1, 1],
    "6" => [1, 2],
    "7" => [0, 0],
    "8" => [0, 1],
    "9" => [0, 2]
  }.freeze

  def self.parse(input)
    input.lines.map(&:chomp)
  end

  def self.part1(input)
    parse(input).sum do |code|
      sequence_size = ("A" + code).chars.each_cons(2).sum do |a, b|
        k_a, k_b = KEYBOARD[a], KEYBOARD[b]
        (k_a[0] - k_b[0]).abs + (k_a[1] - k_b[1]).abs + 1
      end
      sequence_size
    end
  end

  def self.part2(input)
  end
end
