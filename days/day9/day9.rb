module Day9
  def self.parse(input)
    input.chars.map(&:to_i)
  end

  def self.part1(input)
    blocks_str = parse(input).each_slice(2).flat_map.with_index do |(a, b), i|
      [i.to_s] * a + ["."] * (b || 0)
    end
    i = 0
    while i < blocks_str.size
      if blocks_str[i] == "."
        blocks_str.pop while blocks_str[-1] == "."
        blocks_str[i] = blocks_str[-1]
        blocks_str.pop
      end
      i += 1
    end
    blocks_str.map.with_index { |e, i| e.to_i * i }.sum
  end

  # 88208846989 too low
  # 6550518552518 too high
  # 6597474971883 too high
  def self.part2(input)
    blocks_str = parse(input).each_slice(2).flat_map.with_index do |(a, b), i|
      [[i.to_s] * a] + [["."] * (b || 0)]
    end.filter { _1.size > 0 }
    loop do
      changes = 0
      i = 0
      while i < blocks_str.size
        if blocks_str[i][0] == "."
          rindex = blocks_str[i..].reverse.index { _1[0] != "." && _1.size <= blocks_str[i].size }
          break if rindex.nil?
          changes += 1
          index_found_block = - rindex - 1
          found_block = blocks_str[index_found_block]
          if found_block.size < blocks_str[i].size
            blocks_str.insert(i + 1, ["."] * (blocks_str[i].size - found_block.size))
          end
          blocks_str[i] = found_block
          blocks_str[index_found_block] = ["."] * found_block.size
          i += 1
        end
        i += 1
      end
      break if changes.zero?
    end
    blocks_str.flatten.map.with_index { |e, i| e.to_i * i }.sum
  end
end
