require 'pry'

def part1
  x = 0
  y = 0

  File.readlines(File.join(__dir__, 'input.txt')).each do |line|
    line.split.each_cons(2) do |word, number|
      case word
      when 'forward'
        x += number.to_i
      when 'back'
        x -= number.to_i
      when 'down'
        y += number.to_i
      when 'up'
        y -= number.to_i
      end
    end
  end

  puts "horizontal: #{x}"
  puts "depth: #{y}"
  puts "result: #{result = x * y}"

  result
end

def part2
  x = 0
  aim = 0
  depth = 0

  File.readlines(File.join(__dir__, 'input.txt')).each do |line|
    line.split.each_cons(2) do |word, number|
      case word
      when 'forward'
        x += number.to_i
        depth += aim * number.to_i
      when 'down'
        aim += number.to_i
      when 'up'
        aim -= number.to_i
      end
    end
  end

  puts "horizontal: #{x}"
  puts "aim: #{aim}"
  puts "depth: #{depth}"
  puts "result: #{result = x * depth}"

  result
end
