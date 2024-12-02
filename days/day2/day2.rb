module Day2
  def self.parse(input)
    input.lines.map do |line|
      line.split.map(&:to_i)
    end
  end

  def self.part1(input)
    reports = parse(input)
    reports.count do |report|
      is_safe?(report)
    end
  end

  def self.part2(input)
    reports = parse(input)
    reports.count do |report|
      safe = false
      (0...report.size).each do |removed_level|
        safe ||= is_safe?(report[0...removed_level] + report[removed_level + 1..])
        break if safe
      end
      safe
    end
  end

  def self.is_safe?(report)
    safe = true
    direction = nil
    report.each_cons(2) do |a, b|
      diff = (a - b).abs
      safe &&= diff >= 1 && diff <= 3 && (direction.nil? || direction == (a - b > 0))
      break unless safe
      direction = a - b > 0 if direction.nil?
    end
    safe
  end
end
