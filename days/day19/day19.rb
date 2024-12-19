module Day19
  @mem_valid_design = {}

  def self.parse(input)
    towels = input.lines[0].split(",").map(&:strip)
    designs = input.lines[2..].map(&:chomp)
    [towels, designs]
  end

  def self.part1(input)
    towels, designs = parse(input)
    designs.count do |design|
      design[/^(#{towels.join("|")})+$/]
    end
  end

  def self.design_possible(towels, design)
    return 1 if design.nil? || design == ""

    towels.sum do |towel|
      @mem_valid_design[[towel, design]] ||= if design.start_with?(towel)
        design_possible(towels, design[towel.size..])
      else
        0
      end
    end
  end

  def self.part2(input)
    @mem_valid_design = {}
    towels, designs = parse(input)
    designs.sum do |design|
      design[/^(#{towels.join("|")})+$/] ? design_possible(towels, design) : 0
    end
  end
end
