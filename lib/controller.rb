require_relative 'rover'

class Controller

  def initialize(input = Input.new)
    @input = input.parse_text
    @area_coordinate = input.area_coordinate
  end

  def activate_rovers
    increment = 0
    results = []
    @input.count.times do |i|
      rover = Rover.new(@input[increment][0], @input[increment][1], @area_coordinate )
      results << rover.follow_instruction
      increment += 1
    end
    results
  end
end
