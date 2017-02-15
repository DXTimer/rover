require_relative 'rover'
require_relative 'plateau'

class Controller

  def initialize(inputs = Input.new)
    @inputs = inputs.parse_text
    @plateau = Plateau.new(inputs.max_coordinates[0], inputs.max_coordinates[1])
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
      next if @plateau.beacon_exists?(rover.position) && letter == 'M'
      p rover.position
      p @plateau.beacon_exists?('5 1 E')
      initial_position = rover.position.dup
      position = rover.follow_instruction(letter)
      return create_beacon(initial_position) if @plateau.rover_out_of_bound?(position)
    end
      print_position(rover.position)
  end

  def create_beacon(initial_position)
    beacon_position = print_position(initial_position)
    @plateau.beacon << beacon_position
    beacon_position + ' RIP'
  end

  def print_position(position)
    "#{position.x} #{position.y} #{position.direction}"
  end
end
