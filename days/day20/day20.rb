module Day20
  def self.parse(input)
    track = input.lines.map { _1.chomp.chars }
    start_col = nil
    start_row = track.index { start_col = _1.index { |c| c == "S" } }
    [[start_row, start_col], track]
  end

  def self.compute_path(start, track)
    queue = [[start]]
    seen = {}
    while queue.any?
      current, *path = queue.shift
      next if seen[current]
      if track[current[0]][current[1]] == "E"
        return [current] + path
      end

      seen[current] = true
      [[-1, 0], [1, 0], [0, -1], [0, 1]].each do |dx, dy|
        nx, ny = current[0] + dx, current[1] + dy
        next if track[nx][ny] == "#"

        queue << [[nx, ny], current] + path
      end
    end
  end

  def self.distance(a, b)
    (a[0] - b[0]).abs + (a[1] - b[1]).abs
  end

  def self.part1(input)
    start, track = parse(input)
    path = compute_path(start, track)
    count = 0
    path.each_with_index do |a, index|
      path[index + 3..]&.each_with_index do |b, distance_from_a|
        count += 1 if distance(a, b) == 2 && distance_from_a + 1 >= 100
      end
    end
    count
  end

  def self.part2(input)
    start, track = parse(input)
    path = compute_path(start, track)
    count = 0
    path.each_with_index do |a, index|
      mem = [a]
      path[index + 1..].each_with_index do |b, distance_from_a|
        if mem.any? { track[_1][_2] == "#" }
          p distance_from_a
          count += 1
        end
        mem << b
      end
    end
    count
  end
end
