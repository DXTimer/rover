require 'rover'

class Controller

  attr_reader :input

 def initialize(input = Input.new)
   @input = input.rovers_instructions
   @results = []
 end

 def activate_rovers
   a = 0
   input.count.times do |i|
     rover = Rover.new(input[a][0], input[a][1])
     @results << rover.follow_instruction
     a += 1
   end
   @results
 end
end
