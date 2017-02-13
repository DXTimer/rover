require_relative 'rover'

class Controller

  def initialize(input = Input.new)
    @input = input.parse_text
    @x_limit = input.area_coordinate[0]
    @y_limit = input.area_coordinate[1]
  end

  def activate_rovers
    final_position = []
    @input.each do |set_of_instructions|
      rover = Rover.new(set_of_instructions[0], set_of_instructions[1])
      final_position << execute(rover, set_of_instructions[1])
    end
    final_position
  end

  private

  def execute(rover, instructions)
    current_position = ""
    instructions.each_with_index do |letter, index|
      current_position = rover.follow_instruction(letter)
      break if out_of_bound?(current_position, instructions[index + 1])
    end
    current_position.join(' ')
  end

  def out_of_bound?(current_position, next_move)
    return true if reach_east_limit?(current_position) && next_move == 'M'
    return true if reach_west_limit?(current_position) && next_move == 'M'
    return true if reach_north_limit?(current_position) && next_move == 'M'
    return true if reach_south_limit?(current_position) && next_move == 'M'
  end

  def reach_east_limit?(current_position)
    current_position[0] >= @x_limit && current_position[-1] == 'E'
  end

  def reach_west_limit?(current_position)
    current_position[0] <= 0 && current_position[-1] == 'W'
  end

  def reach_north_limit?(current_position)
    current_position[1] >= @y_limit && current_position[-1] == 'N'
  end

  def reach_south_limit?(current_position)
    current_position[1] <= 0 && current_position[-1] == 'S'
  end
end
