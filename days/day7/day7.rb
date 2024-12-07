module Day7
  def self.parse(input)
    input.lines.map do |line|
      total, numbers = line.split(":")
      [total.to_i, numbers.split.map(&:to_i)]
    end
  end

  def self.part1(input)
    parse(input).filter do |total, numbers|
      nb_op = numbers.size - 1
      (0...2**nb_op).any? do |combination_code|
        combination = combination_code.to_s(2).rjust(nb_op, "0").tr("01", "+*").chars
        numbers[1..].map(&:to_s).zip(combination).reduce(numbers[0].to_s) do |s, n|
          eval(s + n[1] + n[0]).to_s # standard:disable Security/Eval
        end.to_i == total
      end
    end.sum { |total, _| total }
  end

  def self.part2(input)
    parse(input).filter do |total, numbers|
      nb_op = numbers.size - 1
      (0...3**nb_op).any? do |combination_code|
        combination = combination_code.to_s(3).rjust(nb_op, "0").tr("012", "+*|").chars
        numbers[1..].map(&:to_s).zip(combination).reduce(numbers[0].to_s) do |s, n|
          (n[1] == "|") ? s + n[0] : eval(s + n[1] + n[0]).to_s # standard:disable Security/Eval
        end.to_i == total
      end
    end.sum { |total, _| total }
  end
end
