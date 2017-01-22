require 'rover'

class Controller

 def initialize(input = Input.new)
   @input = input.parse_text
 end

 def activate_rovers
   increment = 0
   results = []
   @input.count.times do |i|
     rover = Rover.new(@input[increment][0], @input[increment][1])
     results << rover.follow_instruction
     increment += 1
   end
   results
 end
end
