# class Controller
#   def initialize(file = Input.new)
#     # @file = file
#   end
#
# end

# class Rover
#
#   def initialize(input = Controller.new)
#     # @input = input
#   end
#
#   def make_the_move(input)  # [["1 2 N", "LMLMLMLMM"], ["3 3 E", "MMRMMRMRRM"]]
#
#   end
#
# end


input = [["1 2 N", "LMLMLMLMM"], ["3 3 E", "MMRMMRMRRM"]]

def move(input)
  direction_array = ['N', 'E', 'S', 'W']
  position_array = []
  input.each do |i|
    position_array << i[0].split(' ')  #["1", "2", "N"]
    i[1].split('').each do |m|  #["L", "M", "L", "M", "L", "M", "L", "M", "M"]
      if m == 'L' || m == 'R'
        position_array[-1][-1] = adjust_direction(m, position_array, direction_array)
      else
        make_the_move(position_array[-1][-1], position_array)
      end
    end
    puts position_array
  end
end

def adjust_direction(letter, position_array, direction_array)
  p position_array
  if letter == 'L'
    direction_array[(direction_array.index(position_array[-1][-1])) - 1]
  elsif letter == 'R'
    direction_array[(direction_array.index(position_array[-1][-1])) + 1]
  end
end

def make_the_move(direction, position_array)
  position_array[-1][0] = position_array[-1][0].to_i
  position_array[-1][1] = position_array[-1][1].to_i
  case
  when direction == 'N' then position_array[-1][1] += 1
  when direction == 'E' then position_array[-1][0] += 1
  when direction == 'S' then position_array[-1][1] -= 1
  when direction == 'W' then position_array[-1][0] -= 1
  end
end

move(input)

# class Controller
#
#   attr_reader :area_coordinate, :input_for_rovers
#
#   def initialize(file)
#     @file = file
#     @input_array = []
#     @input_for_rovers = []
#     @area_coordinate = ""
#   end
#
#   def parse_text
#     File.readlines(@file).each do |line|
#       @input_array << line.strip
#     end
#
#     @area_coordinate = @input_array.shift
#     @input_array.each_slice(2) { |i| @input_for_rovers << i }
#   end
#
# end

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
