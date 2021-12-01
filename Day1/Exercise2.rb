count = -1
previous_sum = -1

File.readlines('input.txt').each_cons(3) do |a, b, c|
  sum = a.to_i + b.to_i + c.to_i

  count += 1 if sum > previous_sum

  previous_sum = sum
end

puts count

# Elegant way
puts File.read('input.txt').split.map(&:to_i).each_cons(3).map(&:sum).each_cons(2).count { _2 > _1 }
