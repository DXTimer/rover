class Rover

  def initialize(input) #["1 2 N", "LMLMLMLMM"]
    @input = input
    @direction_array = ['N', 'E', 'S', 'W']
    @position_array = []
  end

  def make_the_move(input)
    @position_array << @input[0].split(' ').flatten  #["1", "2", "N"]
    @input[1].split('').each do |letter|  #["L", "M", "L", "M", "L", "M", "L", "M", "M"]
      if letter == 'L' || letter == 'R'
        position_array[-1] = adjust_direction(letter, position_array, direction_array)
      else
        move(position_array[-1], position_array)
      end
    end
    puts position_array
  end

  def adjust_direction(letter, position_array, direction_array)
    if letter == 'L'
      if direction_array.index(position_array[-1]) == 'N'
        direction_array.index('W') - 1
      else
        direction_array[(direction_array.index(position_array[-1])) - 1]
      end
    elsif letter == 'R'
      if direction_array.index(position_array[-1]) == 'W'
        direction_array.index('N') + 1
      else
        direction_array[(direction_array.index(position_array[-1])) + 1]
      end
    end
  end

  def move(direction, position_array)
    case
    when direction == 'N' then position_array[1].to_i += 1
    when direction == 'E' then position_array[0].to_i += 1
    when direction == 'S' then position_array[1].to_i -= 1
    when direction == 'W' then position_array[0].to_i -= 1
    end
  end

end

class Controller
  def initialize(input = Input.new, rover = Rover.new)
    @rovers =
  end

  def connect_rover

  end

end

# input = [["1 2 N", "LMLMLMLMM"], ["3 3 E", "MMRMMRMRRM"]]

# def move(input)
#   direction_array = ['N', 'E', 'S', 'W']
#   position_array = []
#   input.each do |i|
#     position_array << i[0].split(' ').flatten  #["1", "2", "N"]
#     i[1].split('').each do |letter|  #["L", "M", "L", "M", "L", "M", "L", "M", "M"]
#       if letter == 'L' || letter == 'R'
#         position_array[-1] = adjust_direction(letter, position_array, direction_array)
#       else
#         make_the_move(position_array[-1], position_array)
#       end
#     end
#     puts position_array
#   end
# end

# def adjust_direction(letter, position_array, direction_array)
#   if letter == 'L'
#     if direction_array.index(position_array[-1]) == 'N'
#       direction_array.index('W') - 1
#     else
#       direction_array[(direction_array.index(position_array[-1])) - 1]
#     end
#   elsif letter == 'R'
#     if direction_array.index(position_array[-1]) == 'W'
#       direction_array.index('N') + 1
#     else
#       direction_array[(direction_array.index(position_array[-1])) + 1]
#     end
#   end
# end

# def move(direction, position_array)
#   case
#   when direction == 'N' then position_array[1].to_i += 1
#   when direction == 'E' then position_array[0].to_i += 1
#   when direction == 'S' then position_array[1].to_i -= 1
#   when direction == 'W' then position_array[0].to_i -= 1
#   end
# end

class Input

  attr_reader :area_coordinate, :input_for_rovers

  def initialize(file)
    @file = file
    @input_array = []
    @input_for_rovers = []
    @area_coordinate = ""
  end

  def parse_text
    File.readlines(@file).each do |line|
      @input_array << line.strip
    end

    @area_coordinate = @input_array.shift
    @input_array.each_slice(2) { |i| @input_for_rovers << i }
  end

end

# input_array = []
# input_for_rovers = []
#
# File.readlines('test_input.txt').each do |line|
#   input_array << line.strip
# end
#
# area_coordinate = input_array.shift
# input_array.each_slice(2) { |i| input_for_rovers << i }
#
# p area_coordinate
# p input_for_rovers
