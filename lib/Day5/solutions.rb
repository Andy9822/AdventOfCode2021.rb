require 'pry'

def mark_coordinate(x, y, map)
  map[x] = {} if map[x].nil?
  map[x][y] = 0 if map[x][y].nil?
  map[x][y] += 1
  map
end

def part1
  map = {}

  File.readlines(File.join(__dir__, 'input.txt')).each do |line|
    x0, y0, x1, y1 = line.sub(' -> ', ',').split(',').map(&:to_i)

    if x0 == x1
      minor_value, greater_value = [y0, y1].sort

      (minor_value..greater_value).each do |y|
        map = mark_coordinate(x0, y, map)
      end
    elsif y0 == y1
      minor_value, greater_value = [x0, x1].sort

      (minor_value..greater_value).each do |x|
        map = mark_coordinate(x, y0, map)
      end
    end
  end

  puts("result: #{result = map.values.inject(0) { |acc, column| acc + column.values.count { |value| value >= 2 } }}")
  result
end

def part2
  map = {}
  File.readlines(File.join(__dir__, 'input.txt')).each do |line|
    x0, y0, x1, y1 = line.sub(' -> ', ',').split(',').map(&:to_i)

    if x0 == x1
      minor_value, greater_value = [y0, y1].sort

      (minor_value..greater_value).each do |y|
        map = mark_coordinate(x0, y, map)
      end
    elsif y0 == y1
      minor_value, greater_value = [x0, x1].sort

      (minor_value..greater_value).each do |x|
        map = mark_coordinate(x, y0, map)
      end
    else
      if x0 < x1
        origin_x = x0
        origin_y = y0
        destination_x = x1
        destination_y = y1
      else
        origin_x = x1
        origin_y = y1
        destination_x = x0
        destination_y = y0
      end

      y_factor = if origin_y > destination_y
                   -1
                 else
                   1
                 end

      (origin_x..destination_x).each_with_index do |x, idx|
        y = origin_y + (idx * y_factor)
        map = mark_coordinate(x, y, map)
      end
    end
  end

  puts("result: #{result = map.values.inject(0) { |acc, column| acc + column.values.count { |value| value >= 2 } }}")
  result
end
