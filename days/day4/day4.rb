module Day4
  # 2440 your answer is too low
  def self.part1(input)
    total = input.scan("XMAS").size + input.scan("SAMX").size
    cols_number = input[/.*?\n/].size
    total + (0...cols_number).sum do |c|
      before_char = "." * c
      fcol = ->(letters) { Regexp.new letters.map { "^" + before_char + _1 + "[XMAS]*\n" }.join }
      fdiag = ->(letters) { Regexp.new letters.map.with_index { "^" + ("." * _2) + before_char + _1 + "[XMAS]*\n" }.join }
      fdiag2 = ->(letters) { Regexp.new letters.map.with_index { "^" + ("." * (3 - _2)) + before_char + _1 + "[XMAS]*\n" }.join }
      [%w[X M A S], %w[S A M X]].sum { input.scan(fcol[_1]).size + input.scan(fdiag[_1]).size + input.scan(fdiag2[_1]).size }
    end
  end

  def self.part2(input)
  end
end
