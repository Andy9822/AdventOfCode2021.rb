def part1
  count = 0
  File.readlines(File.join(__dir__, 'input.txt')).each_cons(2) do |previous, current|
    count += 1 if current.to_i > previous.to_i
  end

  puts count

  # Elegant way
  puts(
    File.read(File.join(__dir__, 'input.txt'))
           .split
           .map(&:to_i)
           .each_cons(2)
           .count { _1 < _2 }
  )

  count
end

def part2
  count = -1
  previous_sum = -1

  File.readlines(File.join(__dir__, 'input.txt')).each_cons(3) do |a, b, c|
    sum = a.to_i + b.to_i + c.to_i

    count += 1 if sum > previous_sum

    previous_sum = sum
  end

  puts count

  # Elegant way
  puts(
    File.read(File.join(__dir__, 'input.txt'))
           .split
           .map(&:to_i)
           .each_cons(3)
           .map(&:sum)
           .each_cons(2)
           .count { _2 > _1 }
  )

  count
end
