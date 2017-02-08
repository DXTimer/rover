require_relative 'rover'

class Controller

  def initialize(input = Input.new)
    @input = input.parse_text
    @area_coordinate = input.area_coordinate
  end

  def activate_rovers
    increment = 0
    final_coordinates = []
    @input.count.times do |i|
      rover = Rover.new(@input[increment][0], @input[increment][1], @area_coordinate)
      final_coordinates << execute(rover, @input[increment][1])
      increment += 1
    end
    final_coordinates
  end

  def execute(rover, instructions)
    current_position = ""
    instructions.each_with_index do |letter, index|
      current_position = rover.follow_instruction(letter)
      break if out_of_bound?(current_position, instructions[index + 1])
    end
    current_position.join(' ')
  end
end

def out_of_bound?(current_position, next_move)
  return true if current_position[0] >= @area_coordinate[0] && current_position[-1] == 'E'
  return true if current_position[0] <= 0 && current_position[-1] == 'W'
  return true if current_position[1] >= @area_coordinate[1] && current_position[-1] == 'N'
  return true if current_position[1] <= 0 && current_position[-1] == 'S'
end
