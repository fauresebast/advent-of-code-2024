module Day3
  def self.parse(input)
    input
  end

  def self.part1(input)
    input.scan(/mul\(\d{1,3},\d{1,3}\)/).sum do |match|
      match.scan(/\d+/).map(&:to_i).reduce(:*)
    end
  end

  def self.part2(input)
    enable = true
    result = 0
    input.scan(/mul\(\d{1,3},\d{1,3}\)|do\(\)|don't\(\)/).each do |match|
      enable = match[/\d+/] ? enable : match.include?("do()")
      next unless enable && match[/\d+/]
      result += match.scan(/\d+/).map(&:to_i).reduce(:*)
    end
    result
  end
end
