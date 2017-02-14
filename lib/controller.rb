require_relative 'rover'

class Controller

  BEACON = { 'RIP' => [] }

  def initialize(inputs = Input.new)
    @inputs = inputs.parse_text
    @x_limit = inputs.max_coordinates[0]
    @y_limit = inputs.max_coordinates[1]
  end

  def activate_rovers
    final_outputs_from_all_rovers = []
    @inputs.each do |input|
      rover = Rover.new(input[0])
      final_outputs_from_all_rovers << execute(rover, input[1])
    end
    final_outputs_from_all_rovers
  end

  private

  def execute(rover, instructions)
    instructions.each_with_index do |letter, index|
      position = rover.follow_instruction(letter)
      next_move = instructions[index + 1]
      if out_of_bound_position_in_beacon?(position, next_move)
        next
      elsif out_of_bound_position_not_in_beacon?(position, next_move)
        mark_beacon(position)
        break
      end
    end
    "#{rover.position.x} #{rover.position.y} #{rover.position.direction}"
  end

  def out_of_bound_position_in_beacon?(position, next_move)
    out_of_bound?(position, next_move) && BEACON['RIP'].include?(position)
  end

  def out_of_bound_position_not_in_beacon?(position, next_move)
    out_of_bound?(position, next_move) && !BEACON['RIP'].include?(position)
  end

  def mark_beacon(position)
    BEACON['RIP'] << position
    p BEACON
  end

  private

  def out_of_bound?(position, next_move)
    return true if reach_east_limit?(position) && next_move == 'M'
    return true if reach_west_limit?(position) && next_move == 'M'
    return true if reach_north_limit?(position) && next_move == 'M'
    return true if reach_south_limit?(position) && next_move == 'M'
  end

  def reach_east_limit?(position)
    position.x >= @x_limit && position.direction == 'E'
  end

  def reach_west_limit?(position)
    position.x <= 0 && position.direction == 'W'
  end

  def reach_north_limit?(position)
    position.y >= @y_limit && position.direction == 'N'
  end

  def reach_south_limit?(position)
    position.y <= 0 && position.direction == 'S'
  end

end
