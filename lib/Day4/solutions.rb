require 'pry'

def completed_row(matrix)
  matrix.find { |line| line.all? { |element| element[:marked] } }
end

def completed_column(matrix)
  (0..4).find { |n| matrix.all? { |row| row[n][:marked] } }
end

def mark_number(num, bingo)
  bingo.map do |row|
    row.map do |element|
      { number: element[:number], marked: element[:number] == num ? true : element[:marked] }
    end
  end
end

def calculate_result(bingo, num)
  sum = bingo.inject(0) do |acc, row|
    row.inject(acc) do |acc, element|
      acc + (!element[:marked] ? element[:number] : 0)
    end
  end
  sum * num
end

def part1
  sorted_numbers = nil

  line_counter = -1

  bingos = []

  current_bingo = []

  numbers_to_bingos = {}

  File.readlines(File.join(__dir__, 'input.txt')).each_with_index do |line, idx|
    if idx.zero?
      sorted_numbers = line.split(',').map(&:to_i)
      next
    end

    line_counter += 1
    if (line_counter % 6).zero?
      unless current_bingo.empty?
        bingos.append current_bingo
        current_bingo = []
      end
      next
    end

    current_bingo.append(line.split.map(&:to_i).map do |number|
      numbers_to_bingos[number] = [] if numbers_to_bingos[number].nil?
      numbers_to_bingos[number].append(bingos.size)
      { number: number, marked: false }
    end)
  end

  bingos.append current_bingo

  sorted_numbers.each do |sorted_number|
    numbers_to_bingos[sorted_number].each do |bingo_idx|
      bingos[bingo_idx] = mark_number(sorted_number, bingos[bingo_idx])

      next unless completed_row(bingos[bingo_idx]) || completed_column(bingos[bingo_idx])

      puts "result: #{result = calculate_result(bingos[bingo_idx],
                                                sorted_number)}"
      return result
    end
  end
end

def part2
  sorted_numbers = nil

  line_counter = -1

  bingos = []

  current_bingo = []

  numbers_to_bingos = {}

  solved_bingos = []

  File.readlines(File.join(__dir__, 'input.txt')).each_with_index do |line, idx|
    if idx.zero?
      sorted_numbers = line.split(',').map(&:to_i)
      next
    end

    line_counter += 1
    if (line_counter % 6).zero?
      unless current_bingo.empty?
        bingos.append current_bingo
        current_bingo = []
      end
      next
    end

    current_bingo.append(line.split.map(&:to_i).map do |number|
      numbers_to_bingos[number] = [] if numbers_to_bingos[number].nil?
      numbers_to_bingos[number].append(bingos.size)
      { number: number, marked: false }
    end)
  end

  bingos.append current_bingo

  sorted_numbers.each do |sorted_number|
    numbers_to_bingos[sorted_number].each do |bingo_idx|
      next if solved_bingos.include?(bingo_idx)

      bingos[bingo_idx] = mark_number(sorted_number, bingos[bingo_idx])

      next unless completed_row(bingos[bingo_idx]) || completed_column(bingos[bingo_idx])

      solved_bingos.append bingo_idx

      if solved_bingos.size == bingos.size
        puts "result: #{result = calculate_result(bingos[bingo_idx], sorted_number)}"
        return result
      end
    end
  end
end
