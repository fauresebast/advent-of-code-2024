module Day13
  def self.parse(input)
    input.split("\n\n").map do |machine|
      a, b, prize = machine.split("\n")
      [
        {x: a[/(?<=X\+)\d+/].to_i, y: a[/(?<=Y\+)\d+/].to_i},
        {x: b[/(?<=X\+)\d+/].to_i, y: b[/(?<=Y\+)\d+/].to_i},
        {x: prize[/(?<=X=)\d+/].to_i, y: prize[/(?<=Y=)\d+/].to_i}
      ]
    end
  end

  def self.higher_than_prize?(combination, machine)
    a, b, prize = machine
    current_x = a[:x] * combination.count("A") + b[:x] * combination.count("B")
    current_y = a[:y] * combination.count("A") + b[:y] * combination.count("B")
    current_x > prize[:x] || current_y > prize[:y]
  end

  def self.on_prize?(combination, machine)
    a, b, prize = machine
    current_x = a[:x] * combination.count("A") + b[:x] * combination.count("B")
    current_y = a[:y] * combination.count("A") + b[:y] * combination.count("B")
    current_x == prize[:x] && current_y == prize[:y]
  end

  def self.tokens_required(machine)
    valid_combinations_costs = []
    queue = [[["A"], 1], [["B"], 3]]
    seen = {}
    while queue.any?
      combination, cost = queue.shift
      next if seen[combination] || higher_than_prize?(combination, machine)

      seen[combination] = true
      if on_prize?(combination, machine)
        valid_combinations_costs << cost
      else
        queue << [combination + ["A"], cost + 1]
        queue << [combination + ["B"], cost + 3]
      end
    end
    valid_combinations_costs.min || 0
  end

  def self.part1(input)
    parse(input).sum { |machine| tokens_required(machine) }
  end

  def self.part2(input)
  end
end
