require_relative 'rover'
require_relative 'plateau'

class Controller

  def initialize(inputs = Input.new)
    @inputs = inputs.parse_text
    @plateau = Plateau.new(inputs.max_coordinates[0], inputs.max_coordinates[1])
  end

  def activate_rovers
    expected_outputs = []
    @inputs.each do |input|
      rover = Rover.new(input[0])
      expected_outputs << execute(rover, input[1])
    end
    expected_outputs
  end

  private

  def execute(rover, instructions)
    instructions.each do |letter|
      position_str = "#{rover.position.x} #{rover.position.y} #{rover.position.direction}"
      next if @plateau.beacon_exists?(position_str) && letter == 'M'

      initial_position = rover.position.dup
      position = rover.follow_instruction(letter)
      return create_beacon(initial_position) if @plateau.rover_out_of_bound?(position)
    end
      print_position(rover.position)
  end

  def create_beacon(position)
    beacon_position = print_position(position)
    @plateau.beacon << beacon_position
    beacon_position + ' RIP'
  end

  def print_position(position)
    "#{position.x} #{position.y} #{position.direction}"
  end
  
end
