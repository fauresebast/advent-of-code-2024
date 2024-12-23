module Day22
  def self.parse(input)
    input.lines.map(&:to_i)
  end

  def self.next_secret(secret)
    # -- Step 1
    secret ^= (secret * 64)
    secret %= 16777216
    # -- Step 2
    secret ^= (secret / 32)
    secret %= 16777216
    # -- Step 3
    secret ^= (secret * 2048)
    secret % 16777216
  end

  def self.part1(input)
    parse(input).sum do |secret|
      2000.times do
        secret = next_secret(secret)
      end
      secret
    end
  end

  # 1483 too low
  def self.part2(input)
    parse(input).sum do |secret|
      mem = [0, 0, 0, 0, 0]
      2000.times do
        secret = next_secret(secret)
        mem = mem[1..] + [secret % 10]
        break if mem.each_cons(2).map { _2 - _1 } == [-2, 1, -1, 3]
      end
      (mem.each_cons(2).map { _2 - _1 } == [-2, 1, -1, 3]) ? mem[-1] : 0
    end
  end
end
