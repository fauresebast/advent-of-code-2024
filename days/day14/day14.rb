module Day14
  class Robot
    attr_reader :last_projected_position

    def initialize(position, vector)
      @position = position
      @vector = vector
      @last_projected_position = position
    end

    def to_s
      "#{@position}, #{@vector}"
    end

    def project_position(seconds, map_width, map_height)
      @last_projected_position = [
        (@position[0] + @vector[0] * seconds) % map_height,
        (@position[1] + @vector[1] * seconds) % map_width
      ]
    end
  end

  def self.parse(input)
    input.lines.map do |line|
      pos_input, vector_input = line.split
      Robot.new(pos_input.scan(/\d+/).map(&:to_i).reverse, vector_input.scan(/\d+/).map(&:to_i).reverse)
    end
  end

  def self.print_map(robots, width, height)
    (0...height).each do |row_index|
      line = ""
      (0...width).each do |col_index|
        value = robots.count { |r| r.last_projected_position == [row_index, col_index] }
        line += (value > 0) ? value.to_s : "."
      end
      puts line
    end
  end

  def self.part1(input, width, height)
    robots = parse(input)
    robots.map { |r| r.project_position(100, width, height) }
    print_map(robots, width, height)
  end

  def self.part2(input)
  end
end
