count = 0
File.readlines('input.txt').each_cons(2) do |previous, current|
  count += 1 if current.to_i > previous.to_i
end

puts count

# Elegant way
puts(File.read('input.txt')
         .split
         .map(&:to_i)
         .each_cons(2)
         .count { _1 < _2 })
