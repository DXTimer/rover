require_relative 'rover'

class Controller

  def initialize(inputs = Input.new)
    @inputs = inputs.parse_text
    @x_limit = inputs.max_coordinates[0]
    @y_limit = inputs.max_coordinates[1]
  end

  def activate_rovers
    final_position = []
    @inputs.each do |input|
      rover = Rover.new(input[0])
      final_position << execute(rover, input[1])
    end
    final_position
  end

  private

  def execute(rover, instructions)
    current_position = ""
    instructions.each_with_index do |letter, index|
      p current_position = rover.follow_instruction(letter)
      if out_of_bound?(current_position, instructions[index + 1])
        # current_position  #' RIP'
        break
      end
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
