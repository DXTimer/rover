# class Controller
#   def initialize(file = Input.new)
#     # @file = file
#   end
#
# end

class Rover

  def initialize(input = Controller.new)
    # @input = input
  end

  def make_the_move(input)  # [["1 2 N", "LMLMLMLMM"], ["3 3 E", "MMRMMRMRRM"]]

  end

end

class Controller

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
