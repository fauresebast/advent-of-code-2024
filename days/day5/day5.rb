module Day5
  def self.parse(input)
    first_section, second_section = input.split("\n\n")
    must_be_before = {}
    first_section.lines.each do |line|
      a, b = line.split("|").map(&:to_i)
      must_be_before[a] ||= {}
      must_be_before[a][b] = true
    end
    updates = second_section.lines.map { |line| line.split(",").map(&:to_i) }
    [must_be_before, updates]
  end

  def self.valid(must_be_before, update)
    seen = []
    update.all? do |page|
      valid_page = seen.all? { must_be_before.dig(_1, page) }
      seen << page
      valid_page
    end
  end

  def self.part1(input)
    must_be_before, updates = parse(input)
    updates.sum do |update|
      if valid(must_be_before, update)
        update[update.size / 2]
      else
        0
      end
    end
  end

  def self.fix_order(must_be_before, update)
    until valid(must_be_before, update)
      i = 0
      j = 0
      update.each do |k|
        j = i
        if update[i + 1..].any? {
             j += 1
             must_be_before.dig(k, _1).nil?
           }
          break
        else
          i += 1
        end
      end
      update[i], update[j] = update[j], update[i]
    end
    update
  end

  def self.part2(input)
    must_be_before, updates = parse(input)
    updates.sum do |update|
      if valid(must_be_before, update)
        0
      else
        right_order = fix_order(must_be_before, update)
        right_order[right_order.size / 2]
      end
    end
  end
end
