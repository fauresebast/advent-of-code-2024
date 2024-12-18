module Day17
  def self.parse(input)
    registers = input.lines.filter { |l| l["Register"] }.map { |l| l.split(":").last.to_i }
    instructions = input.lines.find { |l| l["Program"] }.split(":").last.split(",").map(&:to_i)
    [registers, instructions]
  end

  def self.run_program(registers, instructions)
    i = 0
    output = []
    while instructions[i]
      opcode = instructions[i]
      literal_operand = instructions[i + 1]
      combo_operand = (literal_operand >= 4) ? registers[literal_operand % 4] : literal_operand
      case opcode
      when 0 # adv
        registers[0] /= (2**combo_operand)
      when 1 # bxl
        registers[1] ^= literal_operand
      when 2 # bst
        registers[1] = combo_operand % 8
      when 3 # jnz
        if registers[0] > 0
          i = literal_operand
          next
        end
      when 4 # bxc
        registers[1] ^= registers[2]
      when 5 # out
        output << combo_operand % 8
      when 6 # bdv
        registers[1] = registers[0] / (2**combo_operand)
      when 7 # adv
        registers[2] = registers[0] / (2**combo_operand)
      else
        raise "Unknown opcode"
      end
      i += 2
    end
    output.join(",")
  end

  def self.part1(input)
    registers, instructions = parse(input)
    run_program(registers, instructions)
  end

  def self.part2(input, value)
    _, instructions = parse(input)
    puts((987628526313286042...987628526313286042 + 199_999_999_999_999_999).step(6_443_206_042).map do |v|
      [v, run_program([v, 0, 0], instructions)]
    end.filter { _2[/^2,4,1,5,7,5,1/] })
  end

  # else
  #   n = 100_000_000_000_000
  #   best_instructions = run_program([n, 0, 0], instructions)
  #   best_errors = errors(best_instructions, instructions)
  #   while best_instructions != instructions
  #     old_n = n
  #     c = n.to_s.chars
  #     c[rand(c.size)] = rand(10)
  #     n = c.join.to_i
  #     new_instructions = run_program([n, 0, 0], instructions)
  #     new_errors = errors(new_instructions, instructions)
  #     if new_errors < best_errors
  #       p new_errors
  #       best_instructions = new_instructions
  #       best_errors = new_errors
  #     else
  #       n = old_n
  #     end
  #   end
  #   p n
  # end
end
